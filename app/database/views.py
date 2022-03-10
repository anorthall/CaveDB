from django.shortcuts import get_object_or_404, render, redirect
from django.http import Http404
from django.db.models import Q
from queryset_sequence import QuerySetSequence
from .models import Region, Cave, CaveSystem, Country


def index(request):
    query = QuerySetSequence(Cave.objects.all(), CaveSystem.objects.all())
    recent_updates = query.order_by("updated_on")[:10].select_related(
        "region",
        "region__country",
    )
    regions = (
        Region.objects.all()
        .select_related(
            "country",
        )
        .prefetch_related(
            "cavesystem_set",
            "cave_set",
        )
    )

    context = {
        "recent": recent_updates,
        "regions": regions,
    }
    return render(request, "dbindex.html", context)


def region(request, slug):
    region = get_object_or_404(Region, slug=slug)
    caves = region.cave_set.all().select_related(
        "organisation",
        "system",
    )
    systems = (
        region.cavesystem_set.all()
        .select_related(
            "organisation",
        )
        .prefetch_related(
            "cave_set",
        )
    )

    context = {
        "region": region,
        "caves": caves,
        "systems": systems,
    }
    return render(request, "region.html", context)


def cave(request, slug):
    context = {
        "cave": get_object_or_404(Cave, slug=slug),
        "type": "cave",
    }
    return render(request, "cave.html", context)


def system(request, slug):
    cave = get_object_or_404(CaveSystem, slug=slug)
    subcaves = cave.cave_set.all().select_related("region")

    context = {
        "cave": cave,
        "caves_in_system": subcaves,
        "type": "system",
    }
    return render(request, "cave.html", context)


def country(request, slug):
    country = get_object_or_404(Country, slug=slug)

    systems = CaveSystem.objects.none()
    caves = Cave.objects.none()
    for region in country.region_set.all():
        caves = caves.union(
            region.cave_set.all().select_related(
                "organisation",
                "region",
                "system",
            )
        )

        systems = systems.union(
            region.cavesystem_set.all()
            .select_related(
                "organisation",
                "region",
            )
            .prefetch_related("cave_set")
        )

    context = {
        "country": country,
        "systems": systems,
        "caves": caves,
    }

    if len(context["caves"]) == 0 and len(context["systems"]) == 0:
        context["no_caves"] = True

    return render(request, "country.html", context)


def search(request):
    if not "terms" in request.GET:
        raise Http404("Search page accessed with no terms specified")

    search_terms = request.GET["terms"].strip()

    # Only allow sensible searches
    if len(search_terms) < 3:
        if len(search_terms) == 0:
            error_msg = "You must enter some search terms. Please try again."
        else:
            error_msg = "You must enter at least three characters into the search box. Please try again."

        context = {
            "terms": search_terms,
            "results": None,
            "number_of_results": 0,
            "error": error_msg,
        }
        return render(request, "search.html", context)

    # Build the results
    query = QuerySetSequence(Cave.objects.all(), CaveSystem.objects.all())
    # Search name and location
    st = search_terms
    results = query.filter(Q(name__icontains=st) | Q(location__iexact=st))
    results = results.select_related(
        "organisation",
        "region",
        "region__country",
    )

    # If only one result, and it's a Cave or CaveSystem, just redirect to the page
    if len(results) == 1:
        result = results[0]
        if result.__class__ == CaveSystem:
            return redirect("db:system", slug=result.slug)
        elif result.__class__ == Cave:
            return redirect("db:cave", slug=result.slug)

    context = {
        "terms": search_terms,
        "results": results,
        "number_of_results": len(results),
    }
    return render(request, "search.html", context)
