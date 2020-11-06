$(function () {
    $('.main-menu').addClass('form-donacion');
    $(document).ready(function() {
        var paso1= $('#paso1')
        var paso2= $('#paso2')
        var paso3= $('#paso3')


        paso1.removeClass('hide-step');
        paso2.addClass('hide-step');
        paso3.addClass('hide-step');
        set_requeridos();

        $("#to_2").click(function () {
            $('#paso1').addClass('hide-step');
            $('#paso2').removeClass('hide-step');
            check_campos_completos('paso1');
        });

        $("#to_3").click(function () {
            $('#paso2').addClass('hide-step');
            $('#paso3').removeClass('hide-step');
            check_campos_completos('paso2');
        });

        $("#back_1").click(function () {
            $('#paso1').removeClass('hide-step');
            $('#paso2').addClass('hide-step');
            console.log(get_monto_donacion())
        });
        $("#back_2").click(function () {
           $('#paso2').removeClass('hide-step');
           $('#paso3').addClass('hide-step');
        });
        $("#to_finish").click(function () {
            alert("Handler for .click() called.");
        });
        paso1.click(function (event) {
            console.log(event.target.id);
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
                console.log(objeto.parentElement)
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
            ;

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
                } else
                {
                    $('#logo-tarjeta').css('display','none');

                }
            }
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
            console.log('aumento')
            if (event.target.checked) {
                $('#aumenta-auto').parent().removeClass('hide-step')
                $('#nota-aumento').parent().removeClass('hide-step')
                campos_aumento();
            }
        })
        $("#dona-mensual").change(function (event) {
            console.log('mensual')
            if (event.target.checked) {
                $('#aumenta-auto').parent().removeClass('hide-step')
                $('#nota-aumento').parent().addClass('hide-step')
                campos_mensual()
            }
        })
        $("#dona-unica").change(function (event) {
            console.log('unica')
            if (event.target.checked) {
                $('#aumenta-auto').parent().addClass('hide-step')
                $('#nota-aumento').parent().addClass('hide-step')
                campos_unica()
            }
        })

        //Formas de Pago
        $("#fpago-paypal").change(function (event) {
            console.log('check paypal')
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
            console.log('fpago-mercadopago')
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
            console.log('fpago-debito')
            if (event.target.checked) {
                set_moneda_pesos();
                mostrar_botonera('valores-fpago-debito');
                hide_cc_cbu();
                $('#cbu-container').removeClass('hide-step')
                $('#to_finish').html('CONFIRMAR')
            }
        })
        $("#fpago-credito").change(function (event) {
            console.log('fpago-credito')
            if (event.target.checked) {
                set_moneda_pesos();
                mostrar_botonera('valores-fpago-credito');
                hide_cc_cbu();
                $('#cc-container').removeClass('hide-step')
                $('to_finish').html('CONFIRMAR')
            }
        })
        $("#chkrecibo").change(function (event) {
            console.log('chkrecibo')
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
    };
    function set_requeridos() {
        $('#nombre div').addClass('requerido');
        $('#apellido div').addClass('requerido');
        $('#documento  div').addClass('requerido');
        $('#genero div').addClass('requerido');
        $('#email div').addClass('requerido');
        $('#direccion div').addClass('requerido');
        $('#codigopostal div').addClass('requerido');
        $('#pais div').addClass('requerido');
        $('#nacimiento div').addClass('requerido');
        $('#telefono div').addClass('requerido');
    }
    function hide_cc_cbu() {
        $('#cbu-container').addClass('hide-step');
        $('#cc-container').addClass('hide-step');
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
            $( ".requerido" ).each(function( index ) {
                foo = $(this)[0].parentElement
                if (!hasClass(foo, 'hide-step')) {
                    sin_completar++;
                    }
            });
        }
        console.log(paso + " sin completar " + sin_completar);
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
});