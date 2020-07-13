from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.shortcuts import render
from wagtail.core.models import Page
from wagtail.search.models import Query
from django.utils import timezone


def donacion_correcta(request):
    return render(request, 'home/thankyou.html', {
        'mensaje_donacion': 'donacion_correcta'
    })


def donacion_enproceso(request):
    return render(request, 'home/thankyou.html', {
        'mensaje_donacion': 'donacion_enproceso'
    })
