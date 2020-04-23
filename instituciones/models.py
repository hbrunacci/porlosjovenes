from django.db import models
from django.conf import settings

from wagtail.core.models import Page
from wagtailgmaps.edit_handlers import MapFieldPanel
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, MultiFieldPanel
from wagtailmetadata.models import MetadataPageMixin
from wagtail.core.models import Page, Orderable
from django.utils.text import slugify
from modelcluster.fields import ParentalKey

import googlemaps

#gmaps = googlemaps.Client(key=KEY)

class Instituciones(MetadataPageMixin, Page):
    template = 'secciones/noticias/noticias.html'
    subpage_types = ['Institucion']

    max_count = 1

    class Meta:
        verbose_name = "Instituciones"
        verbose_name_plural = "Instituciones"


class Institucion(MetadataPageMixin, Page):
    template = 'instituciones/institucion.html'
    subpage_types = []

    institucion_telefono = models.CharField('Telefono', max_length=60, blank=True, null=True)
    institucion_direccion = models.CharField('Direccion', max_length=255)
    institucion_url = models.URLField('WebPage', blank=True, null=True)
    institucion_latlng = models.CharField('LatLng', max_length=255, blank=True, null=True)

    # Use the `MapFieldPanel` just like you would use a `FieldPanel`

    content_panels = Page.content_panels + [
        MapFieldPanel('institucion_direccion'),
        MultiFieldPanel([
            InlinePanel('acciones')
        ], heading='Acciones de la institucion'),
        FieldPanel('institucion_telefono'),
        FieldPanel('institucion_url'),

    ]
    class Meta:
        verbose_name = "Institucion"
        verbose_name_plural = "Instituciones"

    def clean(self):
        # Then call the clean() method of the super  class
        cleaned_data = super(Institucion, self).clean()
        # ... do some cross-fields validation for the subclass
        KEY = settings.WAGTAIL_ADDRESS_MAP_KEY
        gmaps = googlemaps.Client(key=KEY)
        georef = gmaps.geocode(self.institucion_direccion)
        try:
            self.institucion_latlng = georef[0]['geometry']['location']
        except:
            pass
        # Finally, return the cleaned_data
        return cleaned_data

    def get_latlng(self):
        resp = ','.join([(x.split(':')[1]) for x in str(self.institucion_latlng).replace("'", "").replace("}", "").split(',')])
        return resp


class Accion(Orderable):
    page = ParentalKey('instituciones.Institucion', related_name='acciones')

    descripcion = models.CharField(
            "Descripcion",
            max_length=250,
            blank=False,
            null=False,
            help_text='Acciones que se llevan a cabo',
        )

    panels = [
        FieldPanel('descripcion'),
    ]

    class Meta:
        verbose_name = 'accion'
        verbose_name_plural = "acciones"
