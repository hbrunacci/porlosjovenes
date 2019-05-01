from django.db import models
from datetime import datetime

from modelcluster.fields import ParentalKey

from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.contrib.routable_page.models import RoutablePageMixin, route

from wagtail.documents.models import Document
from wagtail.documents.edit_handlers import DocumentChooserPanel
from wagtail.search import index
from wagtail.contrib.forms.models import (
  AbstractEmailForm, AbstractFormField, FORM_FIELD_CHOICES)


class HomePage(Page):
    template = 'home/home_page.html'
    subpage_type = []
    max_count = 1

    banner_imagen = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    banner_url = models.URLField(null=True,
                                 blank=True)

    def get_context(self, request, *args, **kwargs):
        context = super(HomePage, self).get_context(request, *args, **kwargs)
        noticias = Noticias.objects.first()
        context['posts'] = Noticia.objects.descendant_of(noticias).live().order_by('-date')[:3]

        return context

    class Meta:

        verbose_name = "Home Page"
        verbose_name_plural = "Home Pages"

    content_panels = Page.content_panels + [
        ImageChooserPanel('banner_imagen',heading='Imagen banner inferior'),
        FieldPanel('banner_url', heading='Link banner inferior'),
        InlinePanel('slider_home', label="Galeria de Imagenes"),


    ]


class QueHacemos(Page):
    template = 'secciones/quehacemos/quehacemos.html'
    subpage_types = []
    max_count = 1

    banner_imagen = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    banner_url = models.URLField(null=True,
                                 blank=True)
    
    imagen_principal = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    acciones_imagen = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    comunitaria_imagen = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    educacion_imagen = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    trabajo_imagen = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    educacion_texto = models.CharField('Educacion Texto',max_length=400, null=True, blank=False)
    trabajo_texto =  models.CharField('Trabajo Texto',max_length=400, null=True, blank=False)
    comunitaria_texto = models.CharField('Comunitaria Texto',max_length=400,null=True, blank=False)
    acciones_texto = models.CharField('Acciones Texto',max_length=400, null=True, blank=False)

    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_principal',
                          heading='Imagen Central'),

        ImageChooserPanel('banner_imagen',
                          heading='Banner'),
        FieldPanel('banner_url'),

        FieldPanel('educacion_texto'),
        ImageChooserPanel('educacion_imagen'),
        FieldPanel('trabajo_texto'),
        ImageChooserPanel('trabajo_imagen'),
        FieldPanel('comunitaria_texto'),
        ImageChooserPanel('comunitaria_imagen'),
        FieldPanel('acciones_texto'),
        ImageChooserPanel('acciones_imagen'),
    ]
    class Meta:
        verbose_name = "'Que Hacemos'"
        verbose_name_plural = "'Que Hacemos'"


class Nosotros(Page):
    template = 'secciones/nosotros/nosotros.html'
    subpage_types = ['QuienesSomos', 'Transparencia', 'DondeEstamos']
    max_count = 1

    class Meta:
        verbose_name = "'Nosotros'"
        verbose_name_plural = "'Nosotros'"


class QuienesSomos(Page):
    template = 'secciones/nosotros/quienessomos.html'
    subpage_types = []
    max_count = 1
    imagen_principal = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_principal')
    ]

    class Meta:
        verbose_name = "'Quienes Somos'"
        verbose_name_plural = "'Quienes Somos'"


class Transparencia(Page):
    template = 'secciones/nosotros/transparencia.html'
    subpage_types = []
    max_count = 1

    imagen_principal = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_principal'),
        MultiFieldPanel([
            InlinePanel('memoria_balance')
        ], heading='Links a Memoria y Balance ')
    ]
    class Meta:
        verbose_name = "'Transparencia'"
        verbose_name_plural = "'Transparencia'"


class memoria(Orderable):
    page = ParentalKey('home.Transparencia',related_name='memoria_balance')
    memoria_descripcion = models.CharField(max_length=100,null=True,blank=True)
    memoria_url = models.URLField(blank=True,null=True)

    panel = [
        FieldPanel('memoria_descripcion'),
        FieldPanel('memoria_url')
    ]


class DondeEstamos(Page):
    template = 'secciones/nosotros/dondeestamos.html'
    subpage_types = []
    max_count = 1
    imagen_principal = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_principal')
    ]

    class Meta:
        verbose_name = "'Donde Estamos'"
        verbose_name_plural = "'Donde Estamos'"


class ComoColaborar(Page):
    template = 'secciones/comocolaborar.html'
    subpage_types = ['alianzas', 'ayudadifundiendo', 'legado', 'quierodonar']
    max_count = 1

    class Meta:
        verbose_name = "'Como Colaborar'"
        verbose_name_plural = "'Como Colaborar'"


class Alianzas(Page):
    template = 'secciones/comocolaborar/alianzas.html'
    subpage_types = []
    max_count = 1
    imagen_principal = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    nota_pie = RichTextField(features=['h1', 'h2', 'h3', 'h4', 'h5', 'h6', "bold", "italic"],
                             null=True,
                             blank=True)

    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_principal',
                          heading='Imagen Central'),

        FieldPanel('nota_pie'),
        MultiFieldPanel([
            InlinePanel('listado_alianzas')
        ],heading='Listado de Alianzas')

    ]

    class Meta:
        verbose_name = "'Alianzas'"
        verbose_name_plural = "'Alianzas'"


class alianza(Orderable):
    page = ParentalKey('home.Alianzas', related_name='listado_alianzas')
    titulo = models.CharField('Titulo', max_length=100)
    descripcion = RichTextField('Descripcion',
                                features=['h1', 'h2', 'h3', 'h4', 'h5', 'h6', "bold", "italic"],
                                null=True,
                                blank=True)

    panel = [
        FieldPanel('titulo'),
        FieldPanel('descripcion')
    ]


class AyudaDifundiendo(Page):
    template = 'secciones/comocolaborar/ayudadifundiendo.html'
    subpage_types = []
    max_count = 1
    imagen_principal = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_principal',
                          heading='Imagen Central')

    ]

    class Meta:
        verbose_name = "'Ayuda Difundiendo'"
        verbose_name_plural = "'Ayuda Difundiendo'"


class Legado(Page):
    template = 'secciones/comocolaborar/legado.html'
    subpage_types = []
    max_count = 1
    imagen_principal = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_principal',
                          heading='Imagen Central')

    ]

    class Meta:
        verbose_name = "'Ayuda Difundiendo'"
        verbose_name_plural = "'Ayuda Difundiendo'"


class QuieroDonar(Page):
    template = 'secciones/comocolaborar/quierodonar.html'
    subpage_types = []
    max_count = 1

    imagen_principal = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    url_donar = models.URLField('Url iframe donacion unica', blank=True, null=True)
    url_aumentar = models.URLField('Url iframe aumento donacion ', blank=True, null=True)

    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_principal',
                          heading='Imagen Lateral'),
        FieldPanel('url_donar', heading='Link Iframe Donacion Unica'),
        FieldPanel('url_aumentar', heading='Link Iframe Aumento Donacion'),

    ]


    class Meta:
        verbose_name = "'Quiero Donar'"
        verbose_name_plural = "'Quiero Donar'"


class Carrera(Page):
    template = 'secciones/carrera/carrera.html'
    subpage_types = ['Carreras']

    max_count = 1
    imagen_superior_horizontal = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    imagen_superior_vertical = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    imagen_inferior_mapa = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    imagen_inferior_kit = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )

    reglamento = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    politica_menores = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )


    content_panels = Page.content_panels + [
        ImageChooserPanel('imagen_superior_horizontal', heading='Imagen de Slider superior horizontal'),
        ImageChooserPanel('imagen_superior_vertical', heading='Imagen de Slider superior vertical'),
        ImageChooserPanel('imagen_inferior_mapa', heading='Mapa de la carrera'),
        ImageChooserPanel('imagen_inferior_kit', heading='Kit Merchandainsing'),
        DocumentChooserPanel('reglamento', heading='Reglamento general'),
        DocumentChooserPanel('politica_menores', heading='Reglamento para menores'),
        MultiFieldPanel([
            InlinePanel('carousel_videos_anteriores')
        ], heading='Videos Anteriores'
            , classname='collapsible collapsed'),

        MultiFieldPanel([
            InlinePanel('carousel_sponsor_carrera'),
        ], heading='Carrera Sponsor'
            , classname='collapsible collapsed')
    ]

    class Meta:
        verbose_name = "Home Carrera"
        verbose_name_plural = "Home Carrera"


class App(Page):
    template = 'secciones/app/app.html'
    subpage_types = []
    max_count = 1
    video_code = models.CharField(max_length=70, verbose_name='Codigo Video',
                                  blank=True,
                                  null=True)
    content_panels = Page.content_panels + [
        FieldPanel('video_code'),
        MultiFieldPanel([
            InlinePanel('carousel_sponsor_app'),
        ], heading='App Sponsor'
            , classname="collapsible collapsed")
    ]


class SponsorClass(Orderable):

    nombre_sponsor = models.CharField(
        "Empresa",
        max_length=100,
        blank=False,
        null=False,
        help_text='Overwrites the default title',
    )
    imagen_sponsor = models.ForeignKey(
        "wagtailimages.Image",
        blank=False,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL,
    )
    url_sponsor = models.URLField(blank=True, null=True)

    panels = [
        FieldPanel('nombre_sponsor'),
        ImageChooserPanel('imagen_sponsor'),
        FieldPanel('url_sponsor')
    ]


class Meta:
    verbose_name = "'App'"
    verbose_name_plural = "'App'"


class SponsorApp(SponsorClass):
    page = ParentalKey("home.App", related_name='carousel_sponsor_app')


class SponsorCarrera(SponsorClass):
    page = ParentalKey("home.Carrera", related_name='carousel_sponsor_carrera')


class Carreras(Page):
    subpage_type = []
    template = 'secciones/carrera/carrera_data.html'

    inscripcion_url = models.URLField("Link de Incripcion", blank=False, null=False)
    distancia = models.CharField("Distancia", blank=False, null=False, max_length=10)
    valor = models.IntegerField("Valor de Inscripcion" , blank=False, null=False )
    descripcion_categoria = models.CharField("Dificultad",max_length=30 , blank=False, null=False)

    content_panels = Page.content_panels + [
        FieldPanel('descripcion_categoria'),
        FieldPanel('distancia'),
        FieldPanel('valor'),
        FieldPanel('inscripcion_url'),
    ]
    class Meta:
        verbose_name = "Carrera"
        verbose_name_plural = "Carreras"


class Video_Old(Orderable):
    page = ParentalKey("home.Carrera", related_name='carousel_videos_anteriores')
    video_code = models.CharField(max_length=70, verbose_name='Codigo Video',
                                  blank=True,
                                  null=True
                                  )

    panel = [
        FieldPanel('video_code'),
    ]


class Noticias(RoutablePageMixin, Page):
    template = 'secciones/noticias/noticias.html'
    subpage_types = ['Noticia']

    max_count = 1

    def get_context(self, request, *args, **kwargs):
        context = super(Noticias, self).get_context(request, *args, **kwargs)
        context['posts'] = self.posts
        context['blog_page'] = self
        return context

    def get_posts(self):
        return Noticia.objects.descendant_of(self).live().order_by('-date')


    @route(r'^categorias/(?P<category>[-\w]+)/$')
    def post_by_category(self, request, category, *args, **kwargs):
        self.search_type = 'categorias'
        self.search_term = category
        self.posts = self.get_posts().filter(categoria__iexact=category)
        return Page.serve(self, request, *args, **kwargs)


    @route(r'^$')
    def post_list(self, request, *args, **kwargs):
        self.posts = self.get_posts()
        return Page.serve(self, request, *args, **kwargs)

    class Meta:
        verbose_name = "Blog Noticias"
        verbose_name_plural = "Blog Noticias"



class Noticia(Page):
    template = 'secciones/noticias/noticia_detalle.html'
    subpage_types = []
    CATEGORIAS =  (('Educacion','Educacion'),
                                       ('Comunitaria', 'Comunitaria'),
                                       ('Pastorales', 'Pastorales'),
                                       ('Trabajo', 'Trabajo'),
                                       )

    categoria = models.CharField(max_length=30, choices=CATEGORIAS, default='Educacion')
    date = models.DateField("Fecha", default=datetime.now)
    intro = models.CharField("Bajada", max_length=250)
    body = RichTextField("Cuerpo", blank=True)
    imagen_portada = models.ForeignKey(
        'wagtailimages.Image', on_delete=models.SET_NULL,
        null=True,
        blank=False,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('intro'),
        index.SearchField('body'),
    ]

    content_panels = Page.content_panels + [
        FieldPanel('categoria'),
        FieldPanel('date'),
        FieldPanel('intro'),
        FieldPanel('body', classname="full"),
        ImageChooserPanel('imagen_portada'),
        InlinePanel('gallery_images', label="Galeria de Imagenes"),
    ]
    # Overrides the context to list all child items, that are live, by the
    # date that they were published
    # http://docs.wagtail.io/en/latest/getting_started/tutorial.html#overriding-context

    class Meta:
        verbose_name = 'Noticia'
        verbose_name_plural = 'Noticias'


class NoticiaGalleryImage(Orderable):
    page = ParentalKey(Noticia, on_delete=models.CASCADE, related_name='gallery_images')
    image = models.ForeignKey(
        'wagtailimages.Image',
        verbose_name='Imagen',
        on_delete=models.CASCADE,
        related_name='+'
    )
    caption = models.CharField(verbose_name='Etiqueta',
                               blank=True,
                               max_length=250)

    panels = [
        ImageChooserPanel('image'),
        FieldPanel('caption'),
    ]


class Revista(Page):
    template = 'secciones/revista/revistas.html'
    subpage_type = []

    max_count = 1


    content_panels = Page.content_panels + [
        InlinePanel('newsletter_gallery', label="Publicaciones de Revistas"),
    ]

    class Meta:
        verbose_name = 'Revista'
        verbose_name_plural = 'Revistas'


class NewsletterGallery(Orderable):
    page = ParentalKey(Revista,
                       on_delete=models.CASCADE,
                       related_name='newsletter_gallery')
    image = models.ForeignKey('wagtailimages.Image',
                              verbose_name='Imagen',
                              on_delete=models.CASCADE,
                              related_name='+'
                              )
    caption = models.CharField(verbose_name='Etiqueta',
                               blank=True,
                               max_length=200)
    url_boton = models.URLField('Redireccionar a', blank=True)

    panels = [
        ImageChooserPanel('image'),
        FieldPanel('caption'),
        FieldPanel('url_boton'),
    ]


class HomeGalleryImage(Orderable):
    page = ParentalKey(HomePage,
                       on_delete=models.CASCADE,
                       related_name='slider_home')
    image = models.ForeignKey('wagtailimages.Image',
                              verbose_name='Imagen',
                              on_delete=models.CASCADE,
                              related_name='+'
                              )
    caption = models.CharField(verbose_name='Etiqueta',
                               blank=True,
                               max_length=250)
    message = RichTextField('Mensaje', blank=True)
    boton = models.BooleanField('Boton', default=False)
    text_boton = models.CharField(max_length=25,default='',blank=True,null=False)
    url_boton = models.URLField('Redireccionar a', blank=True)

    panels = [
        ImageChooserPanel('image'),
        FieldPanel('caption'),
        FieldPanel('message'),
        FieldPanel('boton'),
        FieldPanel('text_boton'),
        FieldPanel('url_boton'),
    ]
