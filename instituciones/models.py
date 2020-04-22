from django.db import models

from wagtail.core.models import Page
from wagtailgmaps.edit_handlers import MapFieldPanel
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, MultiFieldPanel
from wagtailmetadata.models import MetadataPageMixin
from wagtail.core.models import Page, Orderable
from django.utils.text import slugify
from modelcluster.fields import ParentalKey

class Institucion(MetadataPageMixin, Page):
    template = 'instituciones/institucion.html'
    subpage_types = []

    institucion_telefono = models.CharField('Telefono', max_length=60, blank=True, null=True)
    institucion_direccion = models.CharField('Direccion', max_length=255)
    institucion_url = models.URLField('WebPage', blank=True, null=True)

    # Use the `MapFieldPanel` just like you would use a `FieldPanel`

    content_panels = Page.content_panels + [
        MapFieldPanel('institucion_direccion'),
        MultiFieldPanel([
            InlinePanel('acciones')
        ], heading='Acciones de la institucion'),
        FieldPanel('institucion_telefono'),
        FieldPanel('institucion_url'),

    ]




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
