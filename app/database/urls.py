from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="db-index"),
    path("region/<slug:slug>", views.region, name="db-region"),
    path("cave/<slug:slug>", views.cave, name="db-cave"),
    path("system/<slug:slug>", views.system, name="db-system"),
]
