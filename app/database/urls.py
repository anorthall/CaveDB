from django.urls import path

from . import views

urlpatterns = [
    path("db/", views.index, name="db-index"),
    path("cave/<slug:slug>", views.cave, name="db-cave"),
    path("caves/", views.caveindex, name="db-cave-index"),
    path("system/<slug:slug>", views.system, name="db-system"),
    path("systems/", views.systemindex, name="db-system-index"),
    path("club/", views.club, name="db-club-index"),
]
