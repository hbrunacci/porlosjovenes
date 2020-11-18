from simple_salesforce import Salesforce
from datetime import datetime

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
        sf = Salesforce(username='hbrunaccitest@gmail.com', password='EFN688hb', security_token='aILgOewTl6uriYJVZ0xdL7V8', domain='test')
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
    new_contact['Email'] = contact_data.get('email')
    new_contact['Medio_de_Correspondencia__c'] = 'Correo Electrónico'
    new_contact['N_mero_de_Documento__c'] = contact_data.get('documento')
    new_contact['HomePhone'] = contact_data.get('telefono')
    new_contact['MailingStreet'] = contact_data.get('direccion')
    new_contact['MailingCity'] = contact_data.get('ciudad')
    new_contact['MailingState'] = contact_data.get('estado')
    new_contact['MailingPostalCode'] = contact_data.get('cpostal')
    new_contact['OtherStreet'] = contact_data.get('direccion')
    new_contact['OtherCity'] = contact_data.get('ciudad')
    new_contact['OtherState'] = contact_data.get('estado')
    new_contact['OtherPostalCode'] = contact_data.get('cpostal')
 #   new_contact['Birthdate'] = contact_data.get('fnacimiento')
    new_contact['RecordTypeId'] = get_record_type()
    new_contact['AccountId'] = get_account_id()
    return new_contact

def process_new_compromise(compromise_data=None, contact_id=None):
    compromiso = dict()
    compromiso['Monto_en_pesos__c'] = compromise_data.get('monto_donacion')
    compromiso['Frecuencia__c'] = compromise_data.get('tipo_donante')
    compromiso['Estado__c'] = 'Activo'
    compromiso['Fecha_de_compromiso__c'] = datetime.today().date().__str__()
    compromiso['Fecha_para_realizar_primer_cobranza__c'] = datetime.today().date().replace(day=1).__str__()
    compromiso['Canal_de_Ingreso__c'] = 'Web_DB'
    compromiso['Forma_de_Pago__c'] = get_forma_de_pago(compromise_data.get('forma_pago'))
    compromiso['Tipo_de_tarjeta__c'] = get_cc_company_value(compromise_data.get('pay_company'))
    value = compromise_data.get('cardNumber')
    value = compromise_data.get('cbunumber') if not value else value
    value = compromise_data.get('gatewayuserid') if not value else value
    compromiso['N_mero_de_la_Tarjeta__c'] = value
    compromiso['CBU__c'] = compromise_data.get('cbu', None)
    compromiso['Donante__c'] = contact_id
    return compromiso


def get_forma_de_pago(pay_type):
    types_dict ={
        'fpago-mercadopago':'MercadoPago',
        'fpago-paypal':'Paypal',
        'fpago-debito':'Débito en Cuenta',
        'fpago-credito':'Tarjeta de Crédito',
        'fpago-tdebito':'Tarjeta de Débito'
                 }
    response = types_dict.get(pay_type)
    return response

def get_cc_company_value(cc_company_explicit):
    cc_companies = {
        'diners': 'Diners',
        'amex': 'American Express',
        'master': 'Mastercard',
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
    contact = dict()
    if not form_fields:
        return None
    try:
        sf_con = connect()
        print('normalize')
        form_data = normalize_form_data(form_fields)
        print('contact')
        contact_id = get_or_create_contact(sf_con, form_data.get('contact_info'))    ## verifico si el donante existe, sino lo creo
        print('compromiso')
        compromise = update_or_create_compromise(sf_con, form_data.get('compromise_info'), contact_id)

    except:
        print('error registrando ')
        return False
        #dump a archivo
    return True

def get_account_id():
    return '0012f00000Tnr6ZAAR'

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
    except:
        print('error en inscripcion')
        return None
    return contact.get('id')

def update_or_create_compromise(sf_con, data, contact_id):
    frecuency = data.get('Frecuencia__c')
    print(frecuency)
    data['Donante__c'] = contact_id
    if frecuency == 'actualizacion':
        print('actualizando')
        sf_con.Compromise.create(data)
        #buscar compromisos existentes de es contact_id
        #Identificar el de menor valor y darlo de baja
    print('creando')
    sf_con.Compromise__c.create(data)
    #crear un nuevo compromiso






