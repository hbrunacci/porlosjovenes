from django.shortcuts import render
from django.utils import timezone
from rest_framework.views import APIView
from rest_framework.response import Response
from .functions import register_transaction, demo_compromise_data_mensual

from .MP_functions import create_item_mp
from django.views.generic import TemplateView


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

    def get(self, request):
        data = request.GET
        data = dict(data)
        for key in data.keys():
            data[key] = data[key][0]
        print(data)
        result = register_transaction(data)
        return Response(result)


class pago_aprobado(APIView):
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

