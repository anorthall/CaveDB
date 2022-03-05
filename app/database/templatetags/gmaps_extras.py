from django import template
from django.template.defaultfilters import stringfilter

register = template.Library()


@register.filter()
def gmaps(cave):
    return "https://www.google.com/maps/search/?api=1&query={},{}".format(
        cave.latitude,
        cave.longitude,
    )
