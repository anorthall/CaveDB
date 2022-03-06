# Generated by Django 4.0.3 on 2022-03-06 00:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    replaces = [
        ("database", "0001_initial"),
        ("database", "0002_remove_cave_code_remove_country_code"),
        ("database", "0003_club_abbreviation_organisation_abbreviation"),
        ("database", "0004_alter_cave_length_alter_cavesystem_length"),
        ("database", "0005_alter_cave_length_alter_cavesystem_length"),
        ("database", "0006_alter_cave_length_alter_cavesystem_length"),
        ("database", "0007_alter_cave_length_alter_cavesystem_length"),
        ("database", "0008_cave_slug_cavesystem_slug_club_slug_country_slug_and_more"),
        ("database", "0009_alter_cave_slug_alter_cavesystem_slug_and_more"),
    ]

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Country",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=30, unique=True)),
                ("slug", models.SlugField(unique=True)),
            ],
            options={
                "verbose_name_plural": "countries",
            },
        ),
        migrations.CreateModel(
            name="Region",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=30)),
                ("website", models.URLField(blank=True, null=True)),
                ("wikipedia", models.URLField(blank=True, null=True)),
                ("description", models.TextField()),
                (
                    "country",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.country",
                    ),
                ),
                ("slug", models.SlugField(unique=True)),
            ],
        ),
        migrations.CreateModel(
            name="Organisation",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=50, unique=True)),
                ("website", models.URLField(blank=True, null=True)),
                (
                    "country",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.country",
                    ),
                ),
                (
                    "region",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.region",
                    ),
                ),
                ("abbreviation", models.CharField(default="", max_length=10)),
                ("slug", models.SlugField(unique=True)),
            ],
        ),
        migrations.CreateModel(
            name="CaveSystem",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=50)),
                ("added_on", models.DateTimeField(auto_now_add=True)),
                ("updated_on", models.DateTimeField(auto_now=True)),
                ("location", models.CharField(max_length=50)),
                (
                    "latitude",
                    models.DecimalField(
                        blank=True, decimal_places=6, max_digits=9, null=True
                    ),
                ),
                (
                    "longitude",
                    models.DecimalField(
                        blank=True, decimal_places=6, max_digits=9, null=True
                    ),
                ),
                (
                    "length",
                    models.DecimalField(
                        blank=True,
                        decimal_places=3,
                        max_digits=6,
                        null=True,
                        verbose_name="length in kilometres",
                    ),
                ),
                (
                    "depth",
                    models.IntegerField(
                        blank=True, null=True, verbose_name="depth in metres"
                    ),
                ),
                ("wikipedia", models.URLField(blank=True, null=True)),
                ("website", models.URLField(blank=True, null=True)),
                ("description", models.TextField(blank=True)),
                (
                    "organisation",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.organisation",
                    ),
                ),
                (
                    "region",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.region",
                    ),
                ),
                ("slug", models.SlugField(unique=True)),
            ],
        ),
        migrations.CreateModel(
            name="Cave",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=50)),
                ("added_on", models.DateTimeField(auto_now_add=True)),
                ("updated_on", models.DateTimeField(auto_now=True)),
                ("location", models.CharField(max_length=50)),
                (
                    "latitude",
                    models.DecimalField(
                        blank=True, decimal_places=6, max_digits=9, null=True
                    ),
                ),
                (
                    "longitude",
                    models.DecimalField(
                        blank=True, decimal_places=6, max_digits=9, null=True
                    ),
                ),
                (
                    "length",
                    models.DecimalField(
                        blank=True,
                        decimal_places=3,
                        max_digits=6,
                        null=True,
                        verbose_name="length in kilometres",
                    ),
                ),
                (
                    "depth",
                    models.IntegerField(
                        blank=True, null=True, verbose_name="depth in metres"
                    ),
                ),
                ("wikipedia", models.URLField(blank=True, null=True)),
                ("website", models.URLField(blank=True, null=True)),
                ("description", models.TextField(blank=True)),
                (
                    "organisation",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.organisation",
                    ),
                ),
                (
                    "region",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.region",
                    ),
                ),
                (
                    "system",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.cavesystem",
                    ),
                ),
                ("slug", models.SlugField(unique=True)),
            ],
        ),
        migrations.CreateModel(
            name="Club",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=50, unique=True)),
                ("location", models.CharField(max_length=50)),
                ("website", models.URLField(blank=True, null=True)),
                ("description", models.TextField()),
                (
                    "country",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.country",
                    ),
                ),
                (
                    "region",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.PROTECT,
                        to="database.region",
                    ),
                ),
                ("abbreviation", models.CharField(default="", max_length=10)),
                ("slug", models.SlugField(unique=True)),
            ],
        ),
    ]