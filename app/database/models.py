from django.db import models


class Country(models.Model):
    id = models.CharField(max_length=2, primary_key=True)
    name = models.CharField(max_length=30, unique=True)


class District(models.Model):
    id = models.CharField(max_length=3, primary_key=True)
    name = models.CharField(max_length=30)
    country = models.ForeignKey(
        "Country",
        on_delete=models.PROTECT,
    )
    website = models.URLField(blank=True, null=True)
    wikipedia = models.URLField(blank=True, null=True)
    description = models.TextField()


class CavingBody(models.Model):
    name = models.CharField(max_length=50, unique=True)
    country = models.ForeignKey(
        "Country",
        on_delete=models.PROTECT,
    )
    district = models.ForeignKey(
        "District",
        on_delete=models.PROTECT,
        null=True,
        blank=True,
    )


class Club(models.Model):
    name = models.CharField(max_length=50, unique=True)
    district = models.ForeignKey(
        "District",
        on_delete=models.PROTECT,
    )
    caving_body = models.ForeignKey(
        "CavingBody",
        on_delete=models.PROTECT,
        null=True,
        blank=True,
    )
    location = models.CharField(max_length=50)
    website = models.URLField(blank=True, null=True)
    description = models.TextField()


class System(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    district = models.ForeignKey(
        "District",
        on_delete=models.PROTECT,
    )
    location = models.CharField(max_length=50)
    latitude = models.DecimalField(
        max_digits=9, decimal_places=6, blank=True, null=True
    )
    longitude = models.DecimalField(
        max_digits=9, decimal_places=6, blank=True, null=True
    )
    length = models.IntegerField(verbose_name="Length in metres", blank=True, null=True)
    depth = models.IntegerField(verbose_name="Depth in metres", blank=True, null=True)
    wikipedia = models.URLField(blank=True, null=True)
    caving_body = models.ForeignKey(
        "CavingBody",
        on_delete=models.PROTECT,
        null=True,
        blank=True,
    )
    website = models.URLField(blank=True, null=True)
    description = models.TextField(blank=True)


class Cave(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    district = models.ForeignKey(
        "District",
        on_delete=models.PROTECT,
    )
    system = models.ForeignKey(
        "System",
        on_delete=models.PROTECT,
        null=True,
        blank=True,
    )
    location = models.CharField(max_length=50)
    latitude = models.DecimalField(
        max_digits=9, decimal_places=6, blank=True, null=True
    )
    longitude = models.DecimalField(
        max_digits=9, decimal_places=6, blank=True, null=True
    )
    length = models.IntegerField(verbose_name="Length in metres", blank=True, null=True)
    depth = models.IntegerField(verbose_name="Depth in metres", blank=True, null=True)
    wikipedia = models.URLField(blank=True, null=True)
    caving_body = models.ForeignKey(
        "CavingBody",
        on_delete=models.PROTECT,
        null=True,
        blank=True,
    )
    website = models.URLField(blank=True, null=True)
    description = models.TextField(blank=True)
