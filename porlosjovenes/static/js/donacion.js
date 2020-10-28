$(function () {
    $('.main-menu').addClass('form-donacion');
    $(document).ready(function() {
        var paso1= $('#paso1')
        var paso2= $('#paso2')
        var paso3= $('#paso3')


        paso3.removeClass('hide-step');
        paso2.addClass('hide-step');
        paso1.addClass('hide-step');
        set_requeridos();

        $("#to_2").click(function () {
            $('#paso1').addClass('hide-step');
            $('#paso2').removeClass('hide-step');
        });

        $("#to_3").click(function () {
            $('#paso2').addClass('hide-step');
            $('#paso3').removeClass('hide-step');
        });

        $("#back_1").click(function () {
            $('#paso1').removeClass('hide-step');
            $('#paso2').addClass('hide-step');
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
        });
        paso2.change(function (event) {
            objeto = event.target
            if (objeto.value.length > 0 ) {
               console.log(objeto.parentElement)
               $(objeto.parentElement).removeClass('requerido')
               $(objeto.parentElement).addClass('completo')
            }
            else
            {
               $(objeto.parentElement).removeClass('completo')
               $(objeto.parentElement).addClass('requerido')
            }
            ;

        })

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
                $('to_finish').html('FINALIZAR CON PAYPAL')
                console.log('check')
            }
        })

        $("#fpago-mercadopago").change(function (event) {
            if (event.target.checked) {
                set_moneda_pesos();
                $('to_finish').html('FINALIZAR CON MERCADOPAGO')
                console.log('check')
            }
        })

        $("#fpago-debito").change(function (event) {
            if (event.target.checked) {
                set_moneda_pesos();
                $('to_finish').html('CONFIRMAR')

                console.log('check')
            }
        })

        $("#fpago-credito").change(function (event) {
            if (event.target.checked) {
                set_moneda_pesos();
                $('to_finish').html('CONFIRMAR')
                console.log('check')
            }
        })
    });

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

    function set_moneda_dolar() {
        $('#simbolo-moneda').html('u$s');
        $('#nota_moneda').html('*Montos en DOLARES ESTADOUNIDENSES (U$S)');

    }
    function set_moneda_pesos() {
        $('#simbolo-moneda').html('$');
        $('#nota_moneda').html('*Montos en PESOS ARGENTINOS (ARS)');
    }

    function ocultar_aumento_donacion() {
        var dona_aumento = $("#dona-aumento");
        dona_aumento.parent().addClass("hide-step")
        $('#dona-mensual').prop('checked', true);
    }
});