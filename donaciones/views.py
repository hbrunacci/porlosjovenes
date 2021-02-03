from django.shortcuts import render
from django.utils import timezone
from rest_framework.views import APIView
from rest_framework.response import Response
from .functions import register_transaction, demo_compromise_data_mensual
from django.http import (
    HttpResponse, HttpResponseGone, HttpResponseNotAllowed,
    HttpResponsePermanentRedirect, HttpResponseRedirect,
)
import json
import requests

from .functions import create_item_mp, get_mp_transaccion_info

from django.views.generic import TemplateView, RedirectView

class test_mp(TemplateView):
    template_name = 'donaciones/test_mp.html'

class generar_preference(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request):
        data = request.POST
        data = dict(data)
        for key in data.keys():
            data[key] = data[key][0]
        print(data)
        return Response(create_item_mp(data))

class procesar_pago(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request):
        data = request.POST
        data = dict(data)
        for key in data.keys():
            data[key] = data[key][0]
        print(data)
        result = register_transaction(data)
        return Response(result)

class pago_aprobado(RedirectView):
    authentication_classes = []
    permission_classes = []
    url = '/demo-donacion/'

    def get(self, request, *args, **kwargs):
        url = self.get_redirect_url(*args, **kwargs)
        data = self.request.GET
        data = dict(data)
        for key in data.keys():
            data[key] = data[key][0]
        print(data)
        if url:
            if self.permanent:
                return HttpResponsePermanentRedirect(url)
            else:
                return HttpResponseRedirect(url)

class pago_rechazado(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request):
        data = request.POST
        data = dict(data)
        for key in data.keys():
            data[key] = data[key][0]
        print(data)
        return Response('')

    def get(self, request):
        data = request.GET
        data = dict(data)
        for key in data.keys():
            data[key] = data[key][0]
        print(data)
        return Response('')

class pago_pendiente(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request):
        data = request.POST
        data = dict(data)
        for key in data.keys():
            data[key] = data[key][0]
        print(data)
        return Response('')

    def get(self, request):
        data = request.GET
        data = dict(data)
        for key in data.keys():
            data[key] = data[key][0]
        print(data)
        return Response('')

class notificacion(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request):
        print('post IPN recived')
        body_unicode = request.data.decode('utf-8')
        print(body_unicode)
        if body_unicode:
            body = json.loads(body_unicode)
            data = body.get('content')
            data = dict(data)
            print(f'request: {data}')
            get_mp_transaccion_info(data['resource'])
        return HttpResponse('')

    def get(self, request):
        print('get IPN recived')

        body_unicode = request.data.decode('utf-8')
        if body_unicode:
            body = json.loads(body_unicode)
            data = body.get('content')
            data = dict(data)
            print(f'request: {data}')
        return HttpResponse('')


