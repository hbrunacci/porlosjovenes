from django.shortcuts import render



def donacion_correcta(request):
    return render(request, 'home/thankyou.html', {
        'mensaje_donacion': 'donacion_correcta'
    })


def donacion_enproceso(request):
    return render(request, 'home/thankyou.html', {
        'mensaje_donacion': 'donacion_enproceso'
    })
