from django.shortcuts import render
from django.utils import timezone
from rest_framework.views import APIView
from rest_framework.response import Response
from .functions import register_transaction, demo_compromise_data_mensual
import mercadopago
import json
CLIENT_ID = 'TEST-32b3b724-20ef-4fd1-a922-dc6ac3f8f693'
CLIENT_SECRET = 'TEST-636861273927234-081719-db8d85a01403b156347ea23682f2d702-11760947'

mp = mercadopago.MP(CLIENT_SECRET)
# Create your views here.


class generar_preference(APIView):
    authentication_classes = []
    permission_classes = []

    def get(self, request):
        preference = {
            "items": [
                {
                    "title": "sdk-python",
                    "quantity": 1,
                    "currency_id": "ARS",
                    "unit_price": 1500
                }, ],
            "payment_methods": {
                "excluded_payment_types": [
                    {
                        "id": "ticket"
                    },
                    {
                        "id": "atm"
                    },
                ],
                "excluded_payment_methods": [
                    {
                        "id": "ticket"
                    }
                ],
                "installments": 12
            },
            "notification_url": "https://www.your-site.com/ipn",
        }

        preferenceresult = mp.create_preference(preference)
        return Response(preferenceresult)


def test_mp(request):

    #url = preferenceResult["response"]["init_point"]

    return render(request, 'home/test.html')


def procesar_pago(request):
    if request.POST:
        data = request.POST
        print(data)
    #result = register_transaction(demo_compromise_data_mensual)
    return ''