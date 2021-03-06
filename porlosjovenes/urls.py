from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from django.urls import path
from wagtail.admin import urls as wagtailadmin_urls
from wagtail.core import urls as wagtail_urls
from wagtail.documents import urls as wagtaildocs_urls
from django.views.generic import RedirectView
from home.views import (donacion_correcta,
                        donacion_enproceso)
from donaciones.views import (procesar_pago,test_mp,
                              generar_preference, pago_aprobado, pago_rechazado, pago_pendiente,notificacion)

from search import views as search_views

urlpatterns = [
    url(r'^django-admin/', admin.site.urls),

    url(r'^admin/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),
    url(r'^favicon\.ico$', RedirectView.as_view(url='/static/img/favicon.png')),
    url(r'^search/$', search_views.search, name='search'),
    url(r'^procesar-pago/$', procesar_pago.as_view(), name='procesar-pago'),
    url(r'^pago-aprobado/$', pago_aprobado.as_view(), name='procesar-pago-aprobado'),
    url(r'^pago-rechazado/$', pago_rechazado.as_view(), name='procesar-pago-rechazado'),
    url(r'^pago-pendiente/$', pago_pendiente.as_view(), name='procesar-pago-pendiente'),
    url(r'^ipn/$', notificacion.as_view(), name='procesar-notificacion'),

    url(r'^test_mp/$', test_mp.as_view(), name='test_mp'),
    url(r'^generar-preference/$', generar_preference.as_view(), name='generar-preference'),
    url(r'^donacion_correcta/$', donacion_correcta, name='donacion_correcta'),
    url(r'^donacion_enproceso/$', donacion_enproceso, name='donacion_enproceso'),

    # For anything not caught by a more specific rule above, hand over to
    # Wagtail's page serving mechanism. This should be the last pattern in
    # the list:
    url(r'', include(wagtail_urls)),

    # Alternatively, if you want Wagtail pages to be served from a subpath
    # of your site, rather than the site root:
    #    url(r'^pages/', include(wagtail_urls)),
]


if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

    import debug_toolbar
    urlpatterns = [
        path('__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns
