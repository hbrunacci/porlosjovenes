import os
import sys
sys.path.append(os.path.realpath('.'))

from django.db import models
from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtailmetadata.models import MetadataPageMixin

from home.models import Noticia,Noticias

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

        FieldPanel('hashtag', heading='Hashtag')
    ]


    class Meta:
        verbose_name = "Emergencia Covid"
        verbose_name_plural = "'Emergencia Covid'"

    def get_context(self, request, *args, **kwargs):
        context = super(Covid19, self).get_context(request, *args, **kwargs)
        noticias = Noticias.objects.first()
        context['posts'] = Noticia.objects.descendant_of(noticias).live().order_by('-date')[:3]
        return context

