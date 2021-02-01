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


from donaciones.functions import set_active_compromise

SOY_DONANTE = (
    ('solo_si', 'Ya soy donante'),
    ('solo_no', 'No Soy donante'),
    ('ambos', 'Ambos'),
)

TIPO_DONACION = (
    ('0','Todas'),
    ('1', 'Solo Mensual'),
    ('2', 'Solo Esporáico'),
    ('3', 'Solo Aumento'),
    ('4', 'Mensual - Esporádico'),
    ('5', 'Mensual - Aumento'),
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

    encabezado_agradecimiento = RichTextField(null=False, blank=False,
                                                            default="¡GRACIAS por tu colaboración!")
    texto_agradecimiento = RichTextField(null=False, blank=False,
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

    def serve(self, request, *args, **kwargs):
        if "external_reference" in request.GET:
            print('MP approved')
            set_active_compromise(request.GET['external_reference'])
            return super().serve(request)
        return super().serve(request)


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
    tipo_donacion = models.CharField('Tipo de Donacion', max_length=20, choices=TIPO_DONACION, default='0')
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
        FieldPanel('tipo_donacion'),
        FieldPanel('incremento_automatico'),
        FieldPanel('agradecimiento_compromiso'),
        FieldPanel('agradecimiento_aumento'),

        MultiFieldPanel([InlinePanel('medios_pago', max_num=4)], heading='Medios de Pago', classname='collapsible'),
        MultiFieldPanel([InlinePanel('otros_medios', max_num=6)], heading='Otras formas de colaborar', classname='collapsible'),
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

    def show_mensual(self):
        if self.tipo_donacion in ['0', '1', '4', '5']:
            return True
        return False

    def show_esporadico(self):
        if self.tipo_donacion in ['0', '2', '4']:
            return True
        return False

    def show_aumento(self):
        if self.tipo_donacion in ['0', '3', '5']:
            return True
        return False


class Otros_Medios(Orderable):
    TIPOS_CUENTA = (('cta_cte_pesos', 'Cta. Cte. $'),
                    ('cta_cte_dolar', 'Cta. Cte. u$s'),
                    ('caja_ahorro', 'Caja Ahorro'))

    page = ParentalKey('DonacionPage', related_name='otros_medios')
    nombre_banco = models.CharField("Banco", max_length=20, blank=False, null=False)
    tipo_cta = models.CharField("Tipo de cta", max_length=20, blank=False, null=False, choices=TIPOS_CUENTA)
    nro_cta = models.CharField("Numero de cuenta", max_length=20, blank=False, null=False)
    nro_cbu = models.CharField("Numero CBU", max_length=20, blank=False, null=False)


content_panels = Page.content_panels + [
        FieldPanel('nombre_banco'),
        FieldPanel('tipo_cta'),
        FieldPanel('nro_cta'),
        FieldPanel('nro_cbu'),
    ]


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
