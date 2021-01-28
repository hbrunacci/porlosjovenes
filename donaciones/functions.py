from simple_salesforce import Salesforce
from datetime import datetime, timedelta
from dateutil.relativedelta import *
from .MP_functions import create_item_mp, create_preaproval_mp

demo = {'tipo_donante': 'dona-unica',
        'forma_pago': 'fpago-credito',
        'monto_donacion': '17',
        'nombre': 'Julieta',
        'apellido': 'Rosati',
        'documento': '36990183',
        'genero': 'femenino',
        'email': 'jrosati@donbosco.org.ar',
        'direccion': 'palpa 3121', 'cpostal': '1426', 'pais': 'Argentina',
        'fnacimiento': '1992-06-08', 'telefono': '1539053903', 'sin_completar': '0',
        'pay_company': 'visa', 'sin_completar_step3': '0',
        'cardNumber': '4444444444444444', 'cbunumber': '', 'gatewayuserid': ''}

demo1 = {'tipo_donante': 'dona-unica',
         'forma_pago': 'fpago-debito',
         'monto_donacion': '2',
         'nombre': 'Juan',
         'apellido': 'Perez',
         'documento': '10101010',
         'genero': 'femenino',
         'email': 'hbrunacci@gmail.com',
         'direccion': 'ameghino',
         'cpostal': '1407',
         'pais': 'Argentina',
         'fnacimiento': '2000-02-01',
         'telefono': '55555555',
         'cardNumber': '',
         'cbunumber': '1212312312312312312312',
         'gatewayuserid': ''}

demo_compromiso = 'Id_contacto__c', '0032f00000JYkbq'

demo_compromise_data_mensual = {
'apellido':'Brunacci',
'nombre':'Hernan',
'email':'hbrunacci@gmail.com',
'documento':'27930187',
'telefono':'55555555',
'direccion':'holmberg 2587',
'ciudad':'bsas',
'estado':'Ciudad de Buenos Aires',
'cpostal':'1407',
'fnacimiento':'01/01/2000',
'amount':'125',
'frequency':'Mensual',
'Estado__c':'Activo',
'paymentChannel':'',
'pay_type':'TC',
'pay_company':'Visa',
'cardNumber':'4210541054101234',
'cbunumber':'',
'gatewayuserid':'',
}

demo_compromise_data_unico = {
'apellido':'Brunacci',
'nombre':'Hernan',
'email':'hbrunacci@gmail.com',
'documento':'27930187',
'telefono':'55555555',
'direccion':'holmberg 2587',
'ciudad':'bsas',
'estado':'Ciudad de Buenos Aires',
'cpostal':'1407',
'fnacimiento':'2000-01-01',
'amount':'125',
'frequency':'Esporádica',
'Estado__c':'Activo',
'paymentChannel':'',
'pay_type':'TC',
'pay_company':'Mastercard',
'cardNumber':'5410541054101234',
'cbunumber':'',
'gatewayuserid':'',
}

def connect():
    try:
        sf = Salesforce(username='hernanformnuevo@gmail.com', password='HBS1779hb', security_token='D0hUPrOaXzTQVWvPTKfIu40Ti', domain='test')
    except:
        return None
    return sf


def search_contact(sf=None, field=None, id=None):
    if sf:
        try:
            result = sf.Contact.get_by_custom_id(field, id)
        except:
            print('Error en la busqueda')
            return None
        return result


def is_a_contact(sf_con=None, contact_data=None):
    try:
        id = None
        email = contact_data.get('Email')
        documento = contact_data.get('N_mero_de_Documento__c')
        string_sql = F"SELECT Id, N_mero_de_Documento__c, Email FROM Contact WHERE Email='{email}' or N_mero_de_Documento__c='{documento}' "
        result = sf_con.query(string_sql)
        if result.get('totalSize') > 0:
            for item in result.get('records'):
                if item.get('N_mero_de_Documento__c') == documento:
                    id = item.get('Id')
                    if item.get('Email') == email:
                        return id
                else:
                    id = item.get('Id') if not id else id
            return id
    except:
        return 0


def process_new_contact(contact_data={}):
    new_contact = {}
    new_contact['LastName'] = contact_data.get('apellido')
    new_contact['FirstName'] = contact_data.get('nombre')
    new_contact['Necesita_recibo__c'] =  contact_data.get('recibo')
    new_contact['Sexo__c'] = contact_data.get('genero')
    new_contact['Tipo_de_documento__c'] = 'DNI'
    new_contact['Email'] = contact_data.get('email')
    new_contact['Medio_de_Correspondencia__c'] = 'Correo Electrónico'
    new_contact['N_mero_de_Documento__c'] = contact_data.get('documento').zfill(8)
    new_contact['MobilePhone'] = contact_data.get('telefono')
    new_contact['MailingStreet'] = contact_data.get('direccion')
    new_contact['MailingCity'] = contact_data.get('ciudad')
    new_contact['MailingState'] = contact_data.get('estado')
    new_contact['MailingPostalCode'] = contact_data.get('cpostal')
    new_contact['OtherStreet'] = contact_data.get('direccion')
    new_contact['OtherCity'] = contact_data.get('ciudad')
    new_contact['OtherState'] = contact_data.get('estado')
    new_contact['OtherPostalCode'] = contact_data.get('cpostal')
    new_contact['Birthdate'] = contact_data.get('fnacimiento')
    #    new_contact['Cuit_Cuil__c'] = generar_cuit(new_contact['N_mero_de_Documento__c'],new_contact['Sexo__c'])
    if not contact_data.get('cuit') == '':
        new_contact['Cuit_Cuil__c'] = contact_data.get('cuit')
    new_contact['RecordTypeId'] = get_record_type()
    new_contact['AccountId'] = get_account_id()
    return new_contact


def is_mp(fpago):
    return 'fpago-mercadopago' == fpago


def process_new_compromise(compromise_data=None, contact_id=None):
    compromiso = dict()
    frecuencia = get_frecuencia(compromise_data.get('tipo_donante'))
    fecha_fin = None
    fecha_compromiso = datetime.today().date().__str__()

    if get_forma_de_pago(compromise_data.get('forma_pago')) == 'fpago-debito':
        month_actual = datetime.today().today().month + 1
        new_year = datetime.today().today().year + (month_actual // 12)
        month_actual = month_actual % 12
        nueva_fecha = F'01/{month_actual}/{new_year}'
        new_fecha = datetime.strptime(nueva_fecha, '%d/%m/%Y')
        fecha_primer_cobranza = new_fecha.date().__str__()
    else:
        if frecuencia == 'Esporádica':
            fecha_primer_cobranza = datetime.today().date().__str__()
        else:
            fecha_primer_cobranza = datetime.today().date().replace(day=1).__str__()

    compromiso['Monto_en_pesos__c'] = compromise_data.get('monto_donacion')
    compromiso['Frecuencia__c'] = frecuencia
    #compromiso['Estado__c'] = 'Pendiente' if is_mp(compromise_data.get('forma_pago')) else 'Activo'
    compromiso['Estado__c'] = 'Activo'
    compromiso['Fecha_de_compromiso__c'] = fecha_compromiso
    compromiso['Fecha_para_realizar_primer_cobranza__c'] = fecha_primer_cobranza
    compromiso['Fecha_de_fin_de_compromiso__c'] = fecha_fin
    compromiso['Canal_de_Ingreso__c'] = 'Web PJL'
    compromiso['Tipo_de_compromiso__c'] = None
    compromiso['Forma_de_Pago__c'] = get_forma_de_pago(compromise_data.get('forma_pago'))
    compromiso['Tipo_de_tarjeta__c'] = get_cc_company_value(compromise_data.get('pay_company'))
    value = compromise_data.get('cardNumber')
    value = compromise_data.get('gatewayuserid') if not value else value
    compromiso['N_mero_de_la_Tarjeta__c'] = value
    compromiso['CBU__c'] = compromise_data.get('cbunumber')
    compromiso['Donante__c'] = contact_id
    compromiso['Aumentar_40_anual_donaci_n__c'] = False if compromise_data.get('aumenta') == '0' else True
    return compromiso


def get_forma_de_pago(pay_type):
    types_dict = {
        'fpago-mercadopago': 'Mercado Pago',
        'fpago-paypal': 'PayPal',
        'fpago-debito': 'Débito en Cuenta',
        'fpago-credito': 'Tarjeta de Crédito',
        'fpago-tdebito': 'Tarjeta de Débito'
    }
    response = types_dict.get(pay_type)
    return response


def get_frecuencia(frecuency):
    types_dict = {
        'dona-unica': 'Esporádica',
        'dona-mensual': 'Mensual',
        'dona-aumento': 'Mensual'
        }
    response = types_dict.get(frecuency)
    return response


def get_cc_company_value(cc_company_explicit):
    cc_companies = {
        'diners': 'Diners',
        'amex': 'American Express',
        'mastercard': 'Mastercard',
        'visa': 'Visa',
        'visa_electron': 'Visa Electron (débito)'
    }
    response = cc_companies.get(cc_company_explicit)
    return response

## recibo el dato del formulario


def generate_contact(data=None):
    contact = {}
    return contact


def update_compromise(data=None):
    response = False
    return response


def generate_new_compromise(data=None):
    response = False
    return response


def get_record_type():
    record_type_id = '01261000000ir1SAAQ'
    return record_type_id


def register_transaction(form_fields=None):
    transaccion = dict()
    contact = dict()
    if not form_fields:
        return None
    try:
        sf_con = connect()
        print('normalize')
        form_data = normalize_form_data(form_fields)
        print(form_data)
        print('contact')
        transaccion['contact_id'] = get_or_create_contact(sf_con, form_data.get('contact_info'))    ## verifico si el donante existe, sino lo creo
        print('compromiso')
        transaccion['compromise'] = update_or_create_compromise(sf_con, form_data.get('compromise_info'), transaccion['contact_id'])
        transaccion['result'] = True
        transaccion['detail'] = ''
        if form_fields.get('forma_pago') == 'fpago-mercadopago':
            form_fields['external_id'] = transaccion['compromise'].get('id')
            if form_fields.get('tipo_donante') == 'dona-mensual':
                transaccion['mp_response'] = create_preaproval_mp(form_fields)
            else:
                transaccion['mp_response'] = create_item_mp(form_fields)
    except Exception as e:
        transaccion['result'] = False
        transaccion['detail'] = e
        print(e)
        print('error registrando ')
        #dump a archivo
    return transaccion

def get_account_id():
    #return '0012f00000Tnr6ZAAR'
    return '001e000001ZybZOAAZ'

def normalize_form_data(form_info):
    data = dict()
    data['contact_info'] = process_new_contact(form_info)
    data['compromise_info'] = process_new_compromise(form_info, 0)
    return data

def get_or_create_contact(sf_con, data=None):
    try:
        contact_id = is_a_contact(sf_con, data)
        if contact_id:
            print('udpate_contact')
            sf_con.Contact.upsert(contact_id,data)
            return contact_id
        else:
            print('create contact')
            contact = sf_con.Contact.create(data)
    except Exception as e:
        print(e)
        print('error en inscripcion')
        return None
    return contact.get('id')

def get_last_compromise(sf_con, id_contact):
    res = None
    string_sql = F"SELECT  Id FROM Compromiso__c WHERE Donante__c = '{id_contact}' order by Id desc limit 1"
    rest = sf_con.query(string_sql)
    return rest['records'][0]['Id']

def update_or_create_compromise(sf_con, data, contact_id):
    frecuency = data.get('Frecuencia__c')
    data['Donante__c'] = contact_id
    if frecuency == 'actualizacion':
        print('actualizando compromiso')
        id_compromiso_actualizar = get_last_compromise(sf_con, contact_id)
        if id_compromiso_actualizar:
            print('Actualizar compromiso')
            data['Monto_o_modificado__c'] = True
            data['Monto_Forma_pago_modificado_form_web__c'] = True
            return sf_con.Compromiso__c.upsert(id_compromiso_actualizar, data)
        else:
            print('no tiene compromisos para actualizar, se crea una nueva')
            return sf_con.Compromiso__c.create(data)
    else:
        print('creando compromiso')
        return sf_con.Compromiso__c.create(data)


def generar_cuit(dni='00000000', sexo=''):
    if sexo.upper()[0] == 'M':
        inicio = '20'
    else:
        inicio = '27'

    dni = dni.zfill(8)
    prev = ''.join([inicio, dni])
    verificador = calcular_digito_cuit(prev)
    if verificador == 10:
        inicio = '23'
        prev = ''.join([inicio, dni])
        verificador = calcular_digito_cuit(prev)
    cuit = f"{inicio}{dni}{verificador}"
    return cuit


def calcular_digito_cuit(cuit):
    base = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2]
    # calculo el digito verificador:
    aux = 0
    for i in range(10):
        aux += int(cuit[i]) * base[i]

    aux = 11 - (aux - (int(aux / 11) * 11))
    if aux == 11:
        aux = 0
    return aux


