from django.shortcuts import get_object_or_404, render
from .models import Cave, CaveSystem, Region


def index(request):
    context = {"regions": Region.objects.all()}
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
