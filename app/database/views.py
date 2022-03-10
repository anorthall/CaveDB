from django.shortcuts import get_object_or_404, render, redirect
from django.http import Http404
from queryset_sequence import QuerySetSequence
from .models import Region, Cave, CaveSystem


def index(request):
    query = QuerySetSequence(Cave.objects.all(), CaveSystem.objects.all())
    recent_updates = query.order_by("updated_on")[:10]

    context = {
        "recent": recent_updates,
        "regions": Region.objects.all(),
    }
    return render(request, "dbindex.html", context)


def region(request, slug):
    context = {"region": get_object_or_404(Region, slug=slug)}
    return render(request, "region.html", context)


def cave(request, slug):
    context = {
        "cave": get_object_or_404(Cave, slug=slug),
        "type": "cave",
    }
    return render(request, "cave.html", context)


def system(request, slug):
    context = {
        "cave": get_object_or_404(CaveSystem, slug=slug),
        "type": "system",
    }
    return render(request, "cave.html", context)


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

    # Get the results
    query = QuerySetSequence(Cave.objects.all(), CaveSystem.objects.all())
    results = query.filter(name__icontains=search_terms)

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
