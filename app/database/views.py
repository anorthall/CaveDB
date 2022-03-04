from django.shortcuts import render


def index(request):
    return render(request, "base.html")


def caves(request):
    return render(request, "base.html")


def systems(request):
    return render(request, "base.html")


def clubs(request):
    return render(request, "base.html")
