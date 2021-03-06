from django.test import TestCase
from django.core.exceptions import ValidationError

from decimal import Decimal
from .models import *
from .templatetags.gmaps_extras import gmaps as gmaps_template_filter


class RegionTestCase(TestCase):
    def setUp(self):
        england = Country.objects.create(name="England", slug="england")
        Region.objects.create(
            name="Yorkshire Dales",
            slug="dales",
            country=england,
        )

    def test_region_string(self):
        """Region.__str__() returns the correct format and information"""
        england = Country.objects.get(name="England")
        dales = Region.objects.get(slug="dales")
        self.assertEqual(dales.__str__(), "Yorkshire Dales (England)")


class CaveTestCase(TestCase):
    def setUp(self):
        england = Country.objects.create(name="England", slug="england")
        dales = Region.objects.create(
            name="Yorkshire Dales",
            slug="dales",
            country=england,
        )
        cncc = Organisation.objects.create(
            name="Council of Northern Caving Clubs",
            abbreviation="CNCC",
            slug="CNCC",
            country=england,
            region=dales,
            website="https://cncc.org.uk/",
        )
        three_counties = CaveSystem.objects.create(
            name="Three Counties",
            slug="three-counties",
            region=dales,
            location="Cumbria, Lancashire and North Yorkshire",
            length=Decimal(86.619),
            depth=253,
            wikipedia="https://en.wikipedia.org/wiki/Three_Counties_System",
            organisation=cncc,
            description=(
                "The Three Counties System is a large system in" " the Yorkshire Dales."
            ),
        )
        Cave.objects.create(
            name="Lancaster Hole",
            slug="lancaster-hole",
            region=dales,
            location="Casterton Fell",
            latitude=54.221430,
            longitude=-2.516353,
            length=Decimal(15.057),
            depth=78,
            wikipedia="https://en.wikipedia.org/wiki/Ease_Gill_Caverns",
            organisation=cncc,
            description=(
                "Lancaster Hole is a large cave that comprises part of the"
                " Three Counties System in the Yorkshire Dales."
            ),
            system=three_counties,
        )

    def test_cavesystem_number_of_caves(self):
        """CaveSystem.number_of_caves() should count and update properly"""
        lancaster_hole = Cave.objects.get(name="Lancaster Hole")
        three_counties = CaveSystem.objects.get(name="Three Counties")

        lancaster_hole.system = None
        lancaster_hole.save()
        self.assertEqual(three_counties.number_of_caves(), 0)

        lancaster_hole.system = three_counties
        lancaster_hole.save()
        self.assertEqual(three_counties.number_of_caves(), 1)

    def test_cave_country(self):
        """Cave.country() should return the country of the Region"""
        lancaster_hole = Cave.objects.get(name="Lancaster Hole")
        england = Country.objects.get(name="England")
        self.assertEqual(lancaster_hole.country(), england)

    def test_cavesystem_country(self):
        """CaveSystem.country() should return the country of the Region"""
        three_counties = CaveSystem.objects.get(name="Three Counties")
        england = Country.objects.get(name="England")
        self.assertEqual(three_counties.country(), england)

    def test_google_maps_template_filter(self):
        """Google Maps Template Filter should return correct URL"""
        correct_url = (
            "https://www.google.com/maps/search/?api=1&query="
            "54.221430,-2.516353"  # Lancaster Hole lat/long
        )
        self.assertEqual(
            gmaps_template_filter(Cave.objects.get(name="Lancaster Hole")), correct_url
        )


class GenericOrganisationTestCase(TestCase):
    def setUp(self):
        spain = Country.objects.create(name="Spain", slug="spain")
        england = Country.objects.create(name="England", slug="england")
        england_region = Region.objects.create(
            name="England Region",
            slug="england-region",
            country=england,
            description="An English region.",
        )
        Region.objects.create(
            name="Spain Region",
            slug="spain-region",
            country=spain,
            description="A Spanish region.",
        )
        Club.objects.create(
            name="England Club",
            slug="england-club",
            country=england,
            region=england_region,
            location="Somewhere in England.",
        )
        Organisation.objects.create(
            name="England Organisation",
            slug="england-org",
            country=england,
            region=england_region,
        )

    def test_region_and_country_validation(self):
        """Test that GenericOrganisation.clean() validates Country/Region"""
        spain = Country.objects.get(name="Spain")
        spain_region = Region.objects.get(name="Spain Region")

        # Try to assign Spain as a Country to an English Club
        england_club = Club.objects.get(name="England Club")
        england_club.country = spain
        self.assertRaises(
            ValidationError,
            england_club.full_clean,
        )

        # Try to assign a Spanish region to an English Club
        england_club = Club.objects.get(name="England Club")
        england_club.region = spain_region
        self.assertRaises(
            ValidationError,
            england_club.full_clean,
        )

        # Try to assign Spain as a Country to an English Organisation
        england_org = Organisation.objects.get(name="England Organisation")
        england_org.country = spain
        self.assertRaises(
            ValidationError,
            england_org.full_clean,
        )

        # Try to assign a Spanish region to an English Organisation
        england_org = Organisation.objects.get(name="England Organisation")
        england_org.region = spain_region
        self.assertRaises(
            ValidationError,
            england_org.full_clean,
        )
