from django.shortcuts import render
from database.models import Cave, CaveSystem


def index(request):
    recent = Cave.objects.all().order_by("-updated_on")[:20]
    context = {"recent_updates": recent}
    return render(request, "homepage.html", context)
