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

SOY_DONANTE = (('solo_si', 'Ya soy donante'),
               ('solo_no', 'No Soy donante'),
               ('ambos', 'Ambos'),
               )

class AgradecimientoPage(MetadataPageMixin, Page):
    template = 'donaciones/gracias.html'
    subpage_types = []

    imagen_encabezado = models.ForeignKey(
        "wagtailimages.Image",
        blank=True,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    encabezado_agradecimiento= models.CharField('Encabezado agradecimiento',
                                                            max_length=70,
                                                            default="¡GRACIAS por tu colaboración!")
    texto_agradecimiento= models.CharField('Texto agradecimiento', max_length=100,
                                                       default='Es gracias a personas como vos que podemos '
                                                               'acompañar a miles de jóvenes en todo el país.')

    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_encabezado',
                          heading='Imagen Superior'),
        FieldPanel('encabezado_agradecimiento'),
        FieldPanel('texto_agradecimiento'),
    ]

    class Meta:
        verbose_name = "Pagina Agradeciemiento"
        verbose_name_plural = "Paginas de Agradecimiento"

    def get_meta_url(self):
        return 'https://porlosjovenes.org%s' % self.url

    def get_meta_title(self):
        return self.seo_title or self.title

    def get_meta_description(self):
        return self.search_description

    def get_meta_image(self):
        image = self.search_image
        return image


class DonacionPage(MetadataPageMixin, Page):
    template = 'donaciones/donacion.html'
    subpage_types = []


    texto_encabezado = RichTextField(default='')

    imagen_encabezado = models.ForeignKey(
        "wagtailimages.Image",
        blank=True,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )


    soy_donante = models.CharField('Tipo de Donantes', max_length=10, choices=SOY_DONANTE, default='ambos')
    incremento_automatico = models.IntegerField(default=40)

    agradecimiento_compromiso = models.ForeignKey(
        "wagtailcore.Page",
        null=True,
        blank=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    agradecimiento_aumento = models.ForeignKey(
        "wagtailcore.Page",
        null=True,
        blank=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    content_panels = Page.content_panels + [
        FieldPanel('texto_encabezado'),
        ImageChooserPanel('imagen_encabezado',
                          heading='Imagen Superior'),
        FieldPanel('soy_donante'),
        FieldPanel('incremento_automatico'),
        FieldPanel('agradecimiento_compromiso'),
        FieldPanel('agradecimiento_aumento'),

        MultiFieldPanel([
            InlinePanel('medios_pago', max_num=4)
        ], heading='Medios de Pago'
            , classname='collapsible'),
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

class Medios_Pago(Orderable):
    MONEDAS = (('pesos', 'PESOS'), ('dolares', 'DOLARES'))
    MEDIOS_PAGO = (('fpago-debito', 'Debito en Cta'),
                 ('fpago-credito', 'Tarjeta Credito'),
                 ('fpago-paypal', 'Paypal'),
                 ('fpago-mercadopago', 'MercadoPago'))

    page = ParentalKey('DonacionPage', related_name='medios_pago')
    nombre_medio = models.CharField("Nombre Medio de Pago", max_length=20, blank=False, null=False, choices=MEDIOS_PAGO)
    icono = models.ForeignKey(
        "wagtailimages.Image",
        blank=True,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    ),
    moneda = models.CharField('Moneda', max_length=10, blank=False, null=False, choices=MONEDAS, default='pesos')
    monto_1 = models.IntegerField("Valor 1", blank=False, null=False)
    monto_2 = models.IntegerField("Valor 2", blank=False, null=False)
    monto_3 = models.IntegerField("Valor 3", blank=False, null=False)
    monto_4 = models.IntegerField("Valor 4", blank=False, null=False)
    permite_manual = models.BooleanField('Permite monto manual', default=True)

    content_panels = Page.content_panels + [
        FieldPanel('nombre_medio'),
        FieldPanel('icono'),
        FieldPanel('moneda'),
        FieldPanel('monto_1'),
        FieldPanel('monto_2'),
        FieldPanel('monto_3'),
        FieldPanel('monto_4'),
        FieldPanel('permite_manual'),
    ]

    def get_currency_symbol(self):
        if self.moneda == 'pesos':
            return '$'
        else:
            return 'u$s'
