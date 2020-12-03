
import mercadopago
import json

mp = mercadopago.MP("TEST-5387528471401916-120212-fa2d10844a77167c2bc699c263e2a8ce-681417051")

def create_item_mp(datos_donacion):
    preference = {
        "items": [
            {
                "title": "Donacíon Por los Jovenes",
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
        'back_urls': {'failure': 'http://porlosjovenes.org/fail',
                      'pending': 'http://porlosjovenes.org/pending',
                      'success': 'http://porlosjovenes.org/success'
                      },
        "notification_url": "http://porlosjovenes.org/ipn",
    }

    response = mp.create_preference(preference)
    print(f'response_mp: {response}')
    return response