from csv import list_dialects
from django.contrib import admin

from .models import Cave, System, District, Club, CavingBody, Country

admin.site.register(Cave)
admin.site.register(System)


@admin.register(Country)
class CountryAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "code",
    )


@admin.register(CavingBody)
class CavingBodyAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "district",
        "country",
        "website",
    )


@admin.register(Club)
class ClubAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "location",
        "district",
        "caving_body",
    )


@admin.register(District)
class DistrictAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "code",
        "country",
        "website",
    )
