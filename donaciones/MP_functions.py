from datetime import datetime, timedelta
import mercadopago
import json

mp = mercadopago.MP("TEST-3388812963877314-121814-96dcedce51f3659f1075b43de5036cfa-690014102")
#mp = mercadopago.MP("TEST-636861273927234-081719-db8d85a01403b156347ea23682f2d702-11760947")

def create_preaproval_mp(datos_donacion):
    preaproval = {
        "auto_recurring": {
            "currency_id": "ARS",
            "transaction_amount": int(datos_donacion.get('monto_donacion')),
            "frequency": 1,
            "frequency_type": "months"
          },
        "back_url": datos_donacion.get('web_agradecimiento_compromiso'),

        "collector_id": '',
        "external_reference": datos_donacion.get('external_id'),
        "payer_email": datos_donacion.get('email'),
        "reason": "Donación mensual Por los jóvenes",
        "status": "pending"
    }
    response = mp.create_preapproval_payment(preaproval)
    print(f'response_mp_month: {response}')
    return response

def create_item_mp(datos_donacion):
    preference = {
        "items": [
            {
                "title": "Donación Por los Jovenes",
                "quantity": 1,
                "currency_id": "ARS",
                "unit_price": int(datos_donacion.get('monto_donacion'))
            }, ],
        "external_reference": datos_donacion.get('external_id'),
        "binary_mode": True,
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
            "installments": 1,
        },
        'back_urls': {'failure': get_url('failure', datos_donacion),
                      'pending': get_url('pending', datos_donacion),
                      'success': get_url('success', datos_donacion),
                      },
        "notification_url": "http://porlosjovenes.org/ipn"
    }

    response = mp.create_preference(preference)
    print(f'response_mp_item: {response}')
    return response


def get_url(status, datos_donacion):
    frecuencia = get_frecuencia(datos_donacion.get('tipo_donante'))
    if frecuencia == 'Aumento':
        url = datos_donacion.get('web_agradecimiento_aumento')
    else:
        url = datos_donacion.get('web_agradecimiento_compromiso')
    return url


def get_frecuencia(frecuency):
    types_dict = {
        'dona-unica': 'Esporádica',
        'dona-mensual': 'Mensual',
        'dona-aumento': 'Aumento'
        }
    response = types_dict.get(frecuency)
    return response