$(function () {
    $('.main-menu').addClass('form-donacion');
    $(document).ready(function() {
        $(function () {
            $.ajaxSetup({
                headers: { "X-CSRFToken": getCookie("csrftoken") }
            });
        });
        var paso1= $('#paso1')
        var paso2= $('#paso2')
        var paso3= $('#paso3')
        var datos_donacion = {};

        paso1.removeClass('hide-step');
        paso2.addClass('hide-step');
        paso3.addClass('hide-step');
        set_requeridos();

        $("#to_2").click(function () {
            $('#alerta_falta_tdonante').addClass('hide-step');
            $('#alerta_falta_frecuencia').addClass('hide-step');
            $('#alerta_falta_fpago').addClass('hide-step');
            $('#alerta_falta_monto').addClass('hide-step');
            var completo = true;
            var tipo_donante = get_tipo_donante()
            var tipo_donacion = get_tipo_donacion()
            var forma_pago = get_forma_pago()
            var monto_donacion = get_monto_donacion()

            if (tipo_donante === '0'){
                completo = false;
                $('#alerta_falta_tdonante').removeClass('hide-step');
            } else {
                datos_donacion['tipo_donante'] = tipo_donante

            }
            if (tipo_donacion === '0'){
                completo = false;
                $('#alerta_falta_frecuencia').removeClass('hide-step');
            } else {
                datos_donacion['tipo_donante'] = tipo_donacion
            }

            if (forma_pago === '0'){
                completo = false;
                $('#alerta_falta_fpago').removeClass('hide-step');
            } else {
                datos_donacion['forma_pago'] = forma_pago
            }
            if (monto_donacion === 0) {
                completo = false;
                $('#alerta_falta_monto').removeClass('hide-step');
            } else {
                datos_donacion['monto_donacion'] = monto_donacion
            }

            if (completo === true) {
                $('#paso1').addClass('hide-step');
                $('#paso2').removeClass('hide-step');
            }

        });

        $("#to_3").click(function () {
            var completo = true;
            $('#alerta_datosdonante').addClass('hide-step');
            var datos_paso = check_campos_completos('paso2')
            if (datos_paso['sin_completar'] > 0) {
                console.log('incompleto')
                $('#alerta_datosdonante').removeClass('hide-step');
                completo = false;
            }

            if (completo === true) {
                $.extend(true,datos_donacion,datos_paso);
                $('#paso2').addClass('hide-step');
                $('#paso3').removeClass('hide-step');
            }
        });

        $("#to_finish").click(function () {
            var completo = true;
            var datos_paso = check_campos_completos('paso3')
            $.extend(true,datos_donacion,datos_paso);
            if (datos_paso['sin_completar_step3'] > 0) {
                console.log('incompleto')
                completo = false;
            }
            if (completo===true) {
                $(".loader").css('display','block')
                $.ajax('/procesar-pago/', {
                    type: 'POST',  // http method
                    data: get_form_data(),  // data to submit
                    success: function (data, status, xhr) {
                         $(".loader").fadeOut("slow");
                    },
                    error: function (jqXhr, textStatus, errorMessage) {
                        $(".loader").fadeOut("slow");

                    }
                });
            }
        });

        $("#back_1").click(function () {
            $('#paso1').removeClass('hide-step');
            $('#paso2').addClass('hide-step');

        });
        $("#back_2").click(function () {
           $('#paso2').removeClass('hide-step');
           $('#paso3').addClass('hide-step');
        });

        paso1.click(function (event) {
            ///console.log(event.target.id);
            boton = event.target;
            if (hasClass(boton, 'valor')) {
                $('.valor').each(function () {
                    $(this).removeClass('boton-selected');
                })
                $(boton).addClass('boton-selected');
            }
        });
        paso2.change(function (event) {
            objeto = event.target
            if (objeto.value.length > 0 )  {
                if (!hasClass(objeto.parentElement, 'radio-inline')) {
                    $(objeto.parentElement).removeClass('requerido');
                    $(objeto.parentElement).addClass('completo');
                } else {
                    $(objeto.parentElement.parentElement).removeClass('requerido');
                    $(objeto.parentElement.parentElement).addClass('completo');
                }
            }
            else
            {
               if (!hasClass(objeto.parentElement, 'radio-inline')) {
                   $(objeto.parentElement).removeClass('completo');
                   $(objeto.parentElement).addClass('requerido');
               } else {
                   $(objeto.parentElement.parentElement).removeClass('completo');
                   $(objeto.parentElement.parentElement).addClass('requerido');
               }
            }


        });
        paso3.change(function (event) {
            objeto = event.target
            if (objeto.id === 'credit-card') {
                valor = objeto.value;
                card_name = $.payform.parseCardType(valor);
                if ( $.inArray(card_name, ["visa", "mastercard", "amex", "diners"]) !== -1 )   {
                    $('#logo-tarjeta').css('display','block');
                    card_img_src = statics_img + '/' + card_name +'.png';
                    $('#logo-tarjeta').attr('src', card_img_src);
                    $('#logo-tarjeta').attr('value', card_name);
                }
                else {
                    $('#logo-tarjeta').css('display','none');
                }
            }
        });
        $("#credit-card").keypress(function (e) {
            return !((e.which < 48 || e.which > 57) && (e.which !== 8) && (e.which !== 0));
        });
        $("#cbu-number").keypress(function (e) {
            return !((e.which < 48 || e.which > 57) && (e.which !== 8) && (e.which !== 0));
        });
        // Tipo Donante
        $("#sidonante").change(function (event) {
            if (event.target.checked) {
                $("#dona-aumento").parent().removeClass("hide-step")
            }
        })
        $("#nodonante").change(function (event) {
            if (event.target.checked) {
                ocultar_aumento_donacion();
            }
        })

        //tipo-donacion

        $("#dona-aumento").change(function (event) {
            if (event.target.checked) {
                $('#aumenta-auto').parent().removeClass('hide-step')
                $('#nota-aumento').parent().removeClass('hide-step')
                campos_aumento();
            }
        })
        $("#dona-mensual").change(function (event) {
            if (event.target.checked) {
                $('#aumenta-auto').parent().removeClass('hide-step')
                $('#nota-aumento').parent().addClass('hide-step')
                campos_mensual()
            }
        })
        $("#dona-unica").change(function (event) {
            if (event.target.checked) {
                $('#aumenta-auto').parent().addClass('hide-step')
                $('#nota-aumento').parent().addClass('hide-step')
                campos_unica()
            }
        })

        //Formas de Pago
        $("#fpago-paypal").change(function (event) {
            if (event.target.checked) {
                set_moneda_dolar();
                mostrar_botonera('valores-fpago-paypal');
                ff = statics_img + '/paypal.png';
                hide_cc_cbu();
                $('#to_finish').addClass('boton-logo');
                $('#to_finish').html('FINALIZAR CON<img class="logo-fpago-finish" src=' + ff +' alt="paypal">')
            }
        })
        $("#fpago-mercadopago").change(function (event) {
            if (event.target.checked) {
                set_moneda_pesos();
                mostrar_botonera('valores-fpago-mercadopago');
                ff = statics_img + '/mercadopago.png';
                hide_cc_cbu();
                $('#to_finish').addClass('boton-logo');
                $('#to_finish').html('FINALIZAR CON<img class="logo-fpago-finish" src=' + ff +' alt="mercadopago">');
            }
        })

        $("#fpago-debito").change(function (event) {
            if (event.target.checked) {
                set_moneda_pesos();
                mostrar_botonera('valores-fpago-debito');
                hide_cc_cbu();
                $('#cbu-container').removeClass('hide-step')
                $('#to_finish').html('CONFIRMAR')
            }
        })
        $("#fpago-credito").change(function (event) {
            if (event.target.checked) {
                set_moneda_pesos();
                mostrar_botonera('valores-fpago-credito');
                hide_cc_cbu();
                $('#cc-container').removeClass('hide-step')
                $('to_finish').html('CONFIRMAR')
            }
        })
        function get_form_data() {
            console.log(datos_donacion)
            return datos_donacion
        }

        $("#chkrecibo").change(function (event) {
            if (event.target.checked) {
                $('#recibo-nota').removeClass('hide-step')
            }
                else {
                $('#recibo-nota').addClass('hide-step')
            }
        })

    });
    function hasClass(element, className) {
        return (' ' + element.className + ' ').indexOf(' ' + className+ ' ') > -1;
    }


    function set_requeridos() {
        $('#nombre label').addClass('requerido');
        $('#apellido label').addClass('requerido');
        $('#documento  label').addClass('requerido');
        $('#genero div').addClass('requerido');
        $('#email label').addClass('requerido');
        $('#direccion label').addClass('requerido');
        $('#codigopostal label').addClass('requerido');
        $('#pais label').addClass('requerido');
        $('#nacimiento label').addClass('requerido');
        $('#telefono label').addClass('requerido');
    }
    function hide_cc_cbu() {
        $('#cbu-container').addClass('hide-step');
        $('#cc-container').addClass('hide-step');
        $('#alerta_datostarjeta').addClass('hide-step');
        $('#alerta_datoscbu').addClass('hide-step');
    }
    function get_tipo_donante() {
        response = '0';
        $("[name=optdonante]").each(function () {
             if ($(this).prop('checked')){
                response = $(this).prop('id')
            }
        })
        return response;
    }
    function get_tipo_donacion() {
        response = '0';
        $("[id^=dona-]").each(function () {
             if ($(this).prop('checked')){
                response = $(this).prop('id')
            }
        })
        return response;
    }
    function get_forma_pago() {
        response = '0';
        $("[id^=fpago-]").each(function () {
             if ($(this).prop('checked')){
                response = $(this).prop('id')
            }
        })
        return response;
    }
    function get_monto_donacion(){
        var valor = 0;
        $('.valor').each(function () {
            if ($(this).hasClass('boton-selected')) {
                if ($(this).val() === '') {
                    valor = $(this).attr('value');
                } else
                {
                    valor = $(this).val();
                }
            }
        })
       return valor
    }



    function campos_aumento() {
        $('#nombre').removeClass('hide-step');
        $('#apellido').removeClass('hide-step');
        $('#documento').removeClass('hide-step');
        $('#genero').removeClass('hide-step');
        $('#email').removeClass('hide-step');
        $('#direccion').addClass('hide-step');
        $('#codigopostal').addClass('hide-step');
        $('#pais').addClass('hide-step');
        $('#nacimiento').addClass('hide-step');
        $('#telefono').removeClass('hide-step');

    }
    function campos_mensual() {
        $('#nombre').removeClass('hide-step');
        $('#apellido').removeClass('hide-step');
        $('#documento').removeClass('hide-step');
        $('#genero').removeClass('hide-step');
        $('#email').removeClass('hide-step');
        $('#direccion').removeClass('hide-step');
        $('#codigopostal').removeClass('hide-step');
        $('#pais').removeClass('hide-step');
        $('#nacimiento').removeClass('hide-step');
        $('#telefono').removeClass('hide-step');

    }
    function campos_unica() {
        $('#nombre').removeClass('hide-step');
        $('#apellido').removeClass('hide-step');
        $('#documento').removeClass('hide-step');
        $('#genero').removeClass('hide-step');
        $('#email').removeClass('hide-step');
        $('#direccion').removeClass('hide-step');
        $('#codigopostal').removeClass('hide-step');
        $('#pais').removeClass('hide-step');
        $('#nacimiento').removeClass('hide-step');
        $('#telefono').removeClass('hide-step');
    }
    function check_campos_completos(paso) {
        var sin_completar = 0;

        if (paso === 'paso1') {

        }
        if (paso === 'paso2') {
            var datos_persona = {}
            $(".requerido").each(function(index) {
                foo = $(this)[0].parentElement
                if (!hasClass(foo, 'hide-step')) {
                    sin_completar++;
                    }

            });
            $(".completo input").each(function (index) {
                foo = $(this)[0]
                if (foo.value === 'on') {
                    if (foo.checked) {
                        datos_persona['genero'] = foo.id
                    }
                } else
                {
                    datos_persona[foo.name] = foo.value
                }
            })
            datos_persona['sin_completar'] = sin_completar
            console.log(datos_persona);
            return datos_persona;
        }
        if (paso === 'paso3') {
            var datos_pago = {}
            datos_pago['pay_company'] = $('#logo-tarjeta').attr('value');
            datos_pago['sin_completar_step3'] = 0
            if (!$('#cc-container').hasClass('hide-step')) {
                console.log('cc-number-check');
                len_field = $('#credit-card').val().length;
                if (len_field < 16) {
                    $('#alerta_datostarjeta').removeClass('hide-step');
                    datos_pago['sin_completar_step3'] = 1
                } else
                {
                    $('#alerta_datostarjeta').addClass('hide-step');
                    datos_pago['sin_completar_step3']  = 0
                }
            }
            if (!$('#cbu-container').hasClass('hide-step')) {
                console.log('cbu-number-check');
                len_field = $('#cbu-number').val().length;
                if (len_field < 22) {
                    $('#alerta_datoscbu').removeClass('hide-step');
                    datos_pago['sin_completar_step3'] = 1
                } else
                {
                    $('#alerta_datoscbu').addClass('hide-step');
                    datos_pago['sin_completar_step3'] = 0

                }
            }
            datos_pago['cardNumber'] = $('#credit-card').val();
            datos_pago['cbunumber'] = $('#cbu-number').val();
            datos_pago['pay_company'] = $('#logo-tarjeta').attr('value');
            datos_pago['recibo'] = $('#chkrecibo').checked
            datos_pago['gatewayuserid'] = ''

            return datos_pago
        }

    }
    function set_moneda_dolar() {
        $('#simbolo-moneda').html('u$s');
        $('#nota_moneda').html('*Montos en DOLARES (U$S)');
    }
    function set_moneda_pesos() {
        $('#simbolo-moneda').html('$');
        $('#nota_moneda').html('*Montos en PESOS ARGENTINOS (ARS)');
    }

    function mostrar_botonera(botonera) {
        $("[id^=valores-]").each(function() {
            $(this).addClass('hide-step');
        });
        $('#'+botonera).removeClass('hide-step');
    }

    function ocultar_aumento_donacion() {
        var dona_aumento = $("#dona-aumento");
        dona_aumento.parent().addClass("hide-step")
        $('#dona-mensual').prop('checked', true);
    }
    function getCookie(c_name){
    if (document.cookie.length > 0)
    {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1)
        {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) c_end = document.cookie.length;
            return unescape(document.cookie.substring(c_start,c_end));
        }
    }
    return "";
 }
});