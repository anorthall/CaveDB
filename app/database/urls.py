from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="db-index"),
    path("caves/", views.caves, name="db-caves"),
    path("systems/", views.systems, name="db-systems"),
    path("clubs/", views.clubs, name="db-clubs"),
]
