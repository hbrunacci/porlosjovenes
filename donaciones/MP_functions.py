from datetime import datetime, timedelta
import mercadopago
import json
import requests

# token = "TEST-3493217052506790-020218-c47af1f3374711042909569090f4f1fb-710016242"
token = "APP_USR-4274548783684625-120112-f6e5a9f05b4f650fcbb210688791a930-486091909"
mp = mercadopago.MP(token)

def create_preaproval_mp(datos_donacion):
    preaproval = {
        "auto_recurring": {
            "currency_id": "ARS",
            "transaction_amount": int(datos_donacion.get('monto_donacion')),
            "frequency": 1,
            "frequency_type": "months"
          },
        "auto_return": 'approved',
        "back_url": datos_donacion.get('web_agradecimiento_compromiso'),
        "notification_url": "https://porlosjovenes.org/ipn/",
        "collector_id": '',
        "external_reference": datos_donacion.get('external_id'),
        "payer_email": datos_donacion.get('email'),
        "reason": "Donación mensual Por los jóvenes"
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
        "auto_return": 'approved',
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
        "notification_url": "https://porlosjovenes.org/ipn/"
    }

    response = mp.create_preference(preference)
    print(f'response_mp_item: {response}')
    return response


def get_url(status, datos_donacion):
    frecuencia = get_frecuencia(datos_donacion.get('tipo_donante'))
    if status == 'success':
        if frecuencia == 'Aumento':
            url = datos_donacion.get('web_agradecimiento_aumento')
        else:
            url = datos_donacion.get('web_agradecimiento_compromiso')
    else:
        url ='https://porlosjovenes.org'

    return url




def get_frecuencia(frecuency):
    types_dict = {
        'dona-unica': 'Esporádica',
        'dona-mensual': 'Mensual',
        'dona-aumento': 'Aumento'
        }
    response = types_dict.get(frecuency)
    return response