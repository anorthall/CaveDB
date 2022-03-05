from csv import list_dialects
from django.contrib import admin

from .models import Cave, CaveSystem, Region, Club, Organisation, Country

admin.site.register(Cave)
admin.site.register(CaveSystem)
admin.site.register(Country)


@admin.register(Organisation)
class OrganisationAdmin(admin.ModelAdmin):
    list_display = (
        "name",
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
        "location",
        "region",
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
