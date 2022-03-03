from django.db import models


class Country(models.Model):
    class Meta:
        verbose_name_plural = "Countries"

    name = models.CharField(max_length=30, unique=True)
    code = models.CharField(max_length=3, unique=True)

    def __str__(self):
        return self.name


class District(models.Model):
    name = models.CharField(max_length=30)
    code = models.CharField(max_length=3, unique=True)
    country = models.ForeignKey(
        "Country",
        on_delete=models.PROTECT,
    )
    website = models.URLField(blank=True, null=True)
    wikipedia = models.URLField(blank=True, null=True)
    description = models.TextField()

    def __str__(self):
        return "{} ({})".format(self.name, self.country)


class CavingBody(models.Model):
    class Meta:
        verbose_name_plural = "Caving bodies"

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
    website = models.URLField(blank=True, null=True)

    def __str__(self):
        return self.name


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

    def __str__(self):
        return self.name


class System(models.Model):
    name = models.CharField(max_length=50)
    code = models.IntegerField(unique=True, name="Code")
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

    def __str__(self):
        return self.name


class Cave(models.Model):
    name = models.CharField(max_length=50)
    code = models.IntegerField(unique=True, name="Code")
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

    def __str__(self):
        return self.name
