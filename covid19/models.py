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

class Covid19(MetadataPageMixin, Page):
    template = 'covid19/covid19.html'
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

    texto_inferior = RichTextField(default='')

    imagen_inferior = models.ForeignKey(
        "wagtailimages.Image",
        blank=True,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    hashtag = models.CharField(max_length=50, null=True, blank=True)


    content_panels = Page.content_panels + [
        FieldPanel('texto_encabezado'),
        ImageChooserPanel('imagen_encabezado',
                          heading='Imagen Superior'),
        FieldPanel('texto_inferior'),
        ImageChooserPanel('imagen_inferior',
                          heading='Imagen Inferior'),
        FieldPanel('hashtag', heading='Hashtag'),
        MultiFieldPanel([
            InlinePanel('carousel_sponsor_covid'),
        ], heading='Sponsor campaña covid'
         , classname="collapsible ")


    ]


    class Meta:
        verbose_name = "Emergencia Covid"
        verbose_name_plural = "'Emergencia Covid'"

    def get_meta_url(self):
        return 'https://porlosjovenes.org%s' % self.url

    def get_meta_title(self):
        return self.seo_title or self.title

    def get_meta_description(self):
        return self.search_description

    def get_meta_image(self):
        return self.search_image


    def get_context(self, request, *args, **kwargs):
        context = super(Covid19, self).get_context(request, *args, **kwargs)
        instituciones = Instituciones.objects.first()
        noticias = Noticias.objects.first()
        context['instituciones'] = Institucion.objects.descendant_of(instituciones).live()
        context['noticias'] = Noticia.objects.descendant_of(noticias).live().order_by('-date')[:8]

        return context


class SponsorCovid(SponsorClass):
    page = ParentalKey("covid19.Covid19", related_name='carousel_sponsor_covid')


