from django.db import models


class Country(models.Model):
    class Meta:
        verbose_name_plural = "countries"

    name = models.CharField(max_length=30, unique=True)

    def __str__(self):
        return self.name


class Region(models.Model):
    name = models.CharField(max_length=30)
    country = models.ForeignKey(
        "Country",
        on_delete=models.PROTECT,
    )
    website = models.URLField(blank=True, null=True)
    wikipedia = models.URLField(blank=True, null=True)
    description = models.TextField()

    def __str__(self):
        return "{} ({})".format(self.name, self.country)


class Organisation(models.Model):
    name = models.CharField(max_length=50, unique=True)
    country = models.ForeignKey(
        "Country",
        on_delete=models.PROTECT,
    )
    region = models.ForeignKey(
        "Region",
        on_delete=models.PROTECT,
        null=True,
        blank=True,
    )
    website = models.URLField(blank=True, null=True)

    def __str__(self):
        return self.name


class Club(models.Model):
    name = models.CharField(max_length=50, unique=True)
    country = models.ForeignKey(
        "Country",
        on_delete=models.PROTECT,
    )
    region = models.ForeignKey(
        "Region",
        on_delete=models.PROTECT,
        null=True,
        blank=True,
    )
    location = models.CharField(max_length=50)
    website = models.URLField(blank=True, null=True)
    description = models.TextField()

    def __str__(self):
        return self.name


class CaveSystem(models.Model):
    name = models.CharField(max_length=50)
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    region = models.ForeignKey(
        "Region",
        on_delete=models.PROTECT,
    )
    location = models.CharField(max_length=50)
    latitude = models.DecimalField(
        max_digits=9, decimal_places=6, blank=True, null=True
    )
    longitude = models.DecimalField(
        max_digits=9, decimal_places=6, blank=True, null=True
    )
    length = models.IntegerField(verbose_name="length in metres", blank=True, null=True)
    depth = models.IntegerField(verbose_name="depth in metres", blank=True, null=True)
    wikipedia = models.URLField(blank=True, null=True)
    organisation = models.ForeignKey(
        "Organisation",
        on_delete=models.PROTECT,
        null=True,
        blank=True,
    )
    website = models.URLField(blank=True, null=True)
    description = models.TextField(blank=True)

    def __str__(self):
        return self.name


class Cave(models.Model):
    name = models.CharField(max_length=50)
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    region = models.ForeignKey(
        "Region",
        on_delete=models.PROTECT,
    )
    system = models.ForeignKey(
        "CaveSystem",
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
    length = models.IntegerField(verbose_name="length in metres", blank=True, null=True)
    depth = models.IntegerField(verbose_name="depth in metres", blank=True, null=True)
    wikipedia = models.URLField(blank=True, null=True)
    organisation = models.ForeignKey(
        "Organisation",
        on_delete=models.PROTECT,
        null=True,
        blank=True,
    )
    website = models.URLField(blank=True, null=True)
    description = models.TextField(blank=True)

    def __str__(self):
        return self.name
