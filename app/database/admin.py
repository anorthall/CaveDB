from csv import list_dialects
from django.contrib import admin

from .models import Cave, CaveSystem, Region, Club, Organisation


@admin.register(Cave)
class CaveAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "length",
        "depth",
        "location",
        "region",
        "organisation",
        "country",
    )
    list_filter = (
        "region",
        "organisation",
    )


@admin.register(CaveSystem)
class CaveSystemAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "length",
        "depth",
        "location",
        "region",
        "organisation",
        "country",
    )
    list_filter = (
        "region",
        "organisation",
    )


@admin.register(Organisation)
class OrganisationAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "abbreviation",
        "region",
        "country",
        "website",
    )
    list_filter = (
        "country",
        "region",
    )


@admin.register(Club)
class ClubAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "abbreviation",
        "location",
        "region",
        "country",
    )
    list_filter = (
        "country",
        "region",
    )


@admin.register(Region)
class RegionAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "country",
        "website",
    )
