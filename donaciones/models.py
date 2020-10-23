import os
import sys
sys.path.append(os.path.realpath('.'))

from django.db import models
from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtailmetadata.models import MetadataPageMixin

from modelcluster.fields import ParentalKey

from home.models import Noticia, Noticias, SponsorClass
from instituciones.models import Instituciones, Institucion

class DonacionPage(MetadataPageMixin, Page):
    template = 'donaciones/donacion.html'
    subpage_types = []
    max_count = 1

    texto_encabezado = RichTextField(default='')

    imagen_encabezado = models.ForeignKey(
        "wagtailimages.Image",
        blank=True,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    content_panels = Page.content_panels + [
        FieldPanel('texto_encabezado'),
        ImageChooserPanel('imagen_encabezado',
                          heading='Imagen Superior'),
    ]

    class Meta:
        verbose_name = "Formulacio de Donacion"
        verbose_name_plural = "Formulario de Donacion"

    def get_meta_url(self):
        return 'https://porlosjovenes.org%s' % self.url

    def get_meta_title(self):
        return self.seo_title or self.title

    def get_meta_description(self):
        return self.search_description

    def get_meta_image(self):
        image = self.search_image
        return image


