from django.shortcuts import get_object_or_404, render
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
    context = {"cave": get_object_or_404(Cave, slug=slug)}
    return render(request, "cave.html", context)


def system(request, slug):
    context = {"system": get_object_or_404(CaveSystem, slug=slug)}
    return render(request, "system.html", context)
