from django.urls import path

from . import views

app_name = "db"

urlpatterns = [
    path("", views.index, name="index"),
    path("region/<slug:slug>", views.region, name="region"),
    path("cave/<slug:slug>", views.cave, name="cave"),
    path("system/<slug:slug>", views.system, name="system"),
    path("search/", views.search, name="search"),
]
