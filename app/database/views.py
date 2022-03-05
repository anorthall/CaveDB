from django.shortcuts import get_object_or_404, render
from .models import Cave, CaveSystem


def index(request):
    return render(request, "base.html")


def caveindex(request):
    return render(request, "base.html")


def cave(request, slug):
    context = {"cave": get_object_or_404(Cave, slug=slug)}
    return render(request, "cave.html", context)


def systemindex(request):
    return render(request, "base.html")


def system(request, slug):
    context = {"system": get_object_or_404(CaveSystem, slug=slug)}
    return render(request, "system.html", context)


def club(request):
    return render(request, "base.html")
