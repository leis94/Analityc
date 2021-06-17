import time, os
# import pandas as pd
from django.shortcuts import render, reverse, redirect
from django.http import JsonResponse, HttpResponse
from django.core.exceptions import PermissionDenied
from django.views.decorators.csrf import csrf_exempt
from django.contrib import messages
from .authhelper import get_signin_url, get_token_from_code, get_access_token
from .outlookservice import get_me
from .models import Usuarios
from analityApi.models import Proyectos
# from analityApi.models import Pjs

# def handle_uploaded_file(f):
#     with open('files/%s'%f.name, 'wb+') as destination:
#         for chunk in f.chunks():
#             destination.write(chunk)

#     df_file = pd.read_csv("files/pjs.csv", sep=";")
#     df_pjs = pd.DataFrame(list(Pjs.objects.all().values('pj','pais','ebc','nombre_cliente','unidad')))
    
# def importPjs(request):
#     if request.method == "POST":
#         file = request.FILES.get("file")
#         handle_uploaded_file(file)
#         return JsonResponse({"msg": "success"})
#     else:
#         return render(request, 'pjs_import.html', {})

def login(request):
    redirect_uri = os.environ.get('DJANGO_REDIRECT_URI', request.build_absolute_uri(reverse('gettoken')))
    sign_in_url = get_signin_url(redirect_uri)
    context = { 'signin_url': sign_in_url }
    return render(request, 'login.html', context)

def gettoken(request):
    auth_code = request.GET['code']
    redirect_uri = os.environ.get('DJANGO_REDIRECT_URI', request.build_absolute_uri(reverse('gettoken')))

    token = get_token_from_code(auth_code, redirect_uri)
    access_token = token['access_token']
    user = get_me(access_token)
    try:
        usuario = Usuarios.objects.get(email=user["userPrincipalName"])
    except Usuarios.DoesNotExist:
        messages.error(request,'No tiene permisos para ingresar')
        return redirect('/login/')

    rol = usuario.rol
    name = usuario.nombre
    permisos = usuario.permisos
    pais = usuario.pais
    formularios = usuario.formularios

    if rol in ['PMO', 'OCUPACION', 'PMO-OCU', 'BACKOFFICE-OCU']:
        proyectos = [ proyecto[1] for proyecto in usuario.proyecto.values_list()]
        print(proyectos)
    else:
        proyectos_list = Proyectos.objects.exclude(proyecto="TODOS").values('proyecto').values_list()
        proyectos = [ proyecto[1] for proyecto in proyectos_list]
        pais = ["COLOMBIA" ,"HONDURAS", "COSTA RICA", "GUATEMALA", "NICARAGUA", "EL SALVADOR"]

    expires_in = token['expires_in'] + 3601
    expiration = int(time.time()) + expires_in + 3601

    request.session['access_token'] = access_token
    request.session['refresh_token'] = token['refresh_token']
    request.session['token_expires'] = expiration
    request.session['name'] = name
    request.session['email'] = user['userPrincipalName']
    request.session['proyectos'] = proyectos
    request.session['permisos'] = permisos
    request.session['rol'] = rol
    request.session['pais'] = pais
    request.session['formularios'] = formularios

    # Expirar la session en 2 Horas
    request.session.set_expiry(expires_in)
    
    return redirect('/app/')

@csrf_exempt
def get_user_data(request):
    if request.method == "POST":
        token = request.session.get("access_token",None)
        if token:
            data = {
                'code': 200,
                'access_token': request.session['access_token'],
                'expires_in': request.session['token_expires'],
                'username': request.session['name'],
                'email': request.session['email'],
                'permisos': request.session["permisos"],
                'rol': request.session["rol"],
                'pais': request.session["pais"],
                'formularios': request.session["formularios"]
            }
        else:
            data = {
                'code': 404,
            }
        return JsonResponse(data)
    else:
        raise PermissionDenied

def logout(request):
    request.session.flush()
    data={
        "msg": "success logout"
    }
    return JsonResponse(data)