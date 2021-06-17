from datetime import date, timedelta
from django.shortcuts import render
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser
from rest_framework import status
from django.db.models import Q
from rest_framework.decorators import api_view
from .models import Pjs, Ocupacion, HrsLabor, \
                        Multas, Proyectos, Periodos, \
                            Volumetrias, Ans, ServiciosAns, \
                                ServiciosVol, ServiciosHrsLabor
from .serializers import ProyectoSerializer, PeriodoSerializer, PjSerializer, \
                            MultasSerializer, OcupacionSerializer, HrsLaborSerializer, \
                                VolumetriasSerializer, AnsSerializer, ServiciosAnsSerializer, \
                                    ServiciosVolSerializer, ServiciosHrsLaborSerializer, UsersSerializer
from .decorators import token_required
from login.models import Usuarios

SUCESS_DELETE = "Eliminado Exitosamente"
REGISTER_NOTEXISTS = "El registro con id %s no existe"
ROL_TEST = "BACKOFFICE-OCU"

@api_view(['GET'])
@token_required
def proyectos_list(request, proyectos):
    proyectos = Proyectos.objects.filter(proyecto__in=proyectos, formulario_ocupacion=False)
    proyectos_serializer = ProyectoSerializer(proyectos, many=True)
    return JsonResponse(proyectos_serializer.data, safe=False)

@api_view(['GET'])
@token_required
def proyectos_list_ocupacion(request, proyectos):
    proyectos = Proyectos.objects.filter(proyecto__in=proyectos, formulario_ocupacion=True)
    proyectos_serializer = ProyectoSerializer(proyectos, many=True)
    return JsonResponse(proyectos_serializer.data, safe=False)

@api_view(['GET'])
@token_required
def pjs_list(request, proyectos):
    pjs = Pjs.objects.filter(is_active=True)
    pjs_serializers = PjSerializer(pjs, many=True)
    return JsonResponse(pjs_serializers.data, safe=False)

@api_view(['GET'])
@token_required
def servicios_ans_list(request, proyectos):
    servicios = ServiciosAns.objects.filter(proyecto__proyecto__in=proyectos)
    servicios_serializers = ServiciosAnsSerializer(servicios, many=True)
    return JsonResponse(servicios_serializers.data, safe=False)

@api_view(['GET'])
@token_required
def servicios_ans_detail(request, proyectos, pk):
    try:
        proyecto = Proyectos.objects.get(id=pk)
        servicios = ServiciosAns.objects.filter(proyecto=proyecto)
        servicios_serializers = ServiciosAnsSerializer(servicios, many=True)
        return JsonResponse(servicios_serializers.data, safe=False)
    except Proyectos.DoesNotExist:
        return JsonResponse({'message': 'Proyecto no existe'}, status=status.HTTP_404_NOT_FOUND)

@api_view(['GET'])
@token_required
def servicios_vol_list(request, proyectos):
    servicios = ServiciosVol.objects.filter(proyecto__proyecto__in=proyectos)
    servicios_serializers = ServiciosVolSerializer(servicios, many=True)
    return JsonResponse(servicios_serializers.data, safe=False)

@api_view(['GET'])
@token_required
def servicios_vol_detail(request, proyectos, pk):
    try:
        proyecto = Proyectos.objects.get(id=pk)
        servicios = ServiciosVol.objects.filter(proyecto=proyecto)
        servicios_serializers = ServiciosVolSerializer(servicios, many=True)
        return JsonResponse(servicios_serializers.data, safe=False)
    except Proyectos.DoesNotExist:
        return JsonResponse({'message': 'Proyecto no existe'}, status=status.HTTP_404_NOT_FOUND)

@api_view(['GET'])
@token_required
def servicios_hrs_labor_list(request, proyectos):
    servicios = ServiciosHrsLabor.objects.filter(proyecto__proyecto__in=proyectos)
    servicios_serializers = ServiciosHrsLaborSerializer(servicios, many=True)
    return JsonResponse(servicios_serializers.data, safe=False)

@api_view(['GET'])
@token_required
def servicios_hrs_labor_detail(request, proyectos, pk):
    try:
        proyecto = Proyectos.objects.get(id=pk)
        servicios = ServiciosHrsLabor.objects.filter(proyecto=proyecto)
        servicios_serializers = ServiciosHrsLaborSerializer(servicios, many=True)
        return JsonResponse(servicios_serializers.data, safe=False)
    except Proyectos.DoesNotExist:
        return JsonResponse({'message': 'Proyecto no existe'}, status=status.HTTP_404_NOT_FOUND)

@api_view(['GET'])
@token_required
def periodos_list(request, proyectos):
    periodos = Periodos.objects.all().order_by('-id')
    periodos_serializers = PeriodoSerializer(periodos, many=True)
    return JsonResponse(periodos_serializers.data, safe=False)

@api_view(['GET', 'POST'])
@token_required
def multas_list(request, proyectos):
    if request.method == 'GET':
        multas = Multas.objects.filter(proyecto__proyecto__in=proyectos).order_by('-id')
        multas_serializer = MultasSerializer(multas, many=True)
        return JsonResponse(multas_serializer.data, safe=False)
    elif request.method == 'POST':
        multas_data = JSONParser().parse(request)
        proyecto_id = multas_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = multas_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        pj_id = multas_data.get("pj").get("id")
        pj_instance = Pjs.objects.filter(id=pj_id).first()
        multas_serializer = MultasSerializer(data=multas_data)
        if multas_serializer.is_valid():
            multas_serializer.save(proyecto=proyecto_instance, periodo=periodo_instance, pj=pj_instance)
            return JsonResponse(multas_serializer.data, status=status.HTTP_201_CREATED)
        return JsonResponse(multas_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@token_required
def multas_detail(request, proyectos, pk):
    try:
        multa = Multas.objects.get(pk=pk)
    except Multas.DoesNotExist:
        return JsonResponse({'message': 'La multa no existe'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        multa_serializer = MultasSerializer(multa)
        return JsonResponse(multa_serializer.data)
    elif request.method == 'PUT':
        multa_data = JSONParser().parse(request)
        proyecto_id = multa_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = multa_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        pj_id = multa_data.get("pj").get("id")
        pj_instance = Pjs.objects.filter(id=pj_id).first()
        multa_serializer = MultasSerializer(multa, data=multa_data)
        if multa_serializer.is_valid():
            multa_serializer.save(proyecto=proyecto_instance,periodo=periodo_instance, pj=pj_instance)
            return JsonResponse(multa_serializer.data)
        return JsonResponse(multa_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        multa.delete()
        return JsonResponse({'message': SUCESS_DELETE})

@api_view(['GET', 'POST'])
@token_required
def ocupacion_list(request, proyectos):
    if request.method == 'GET':
        email = request.session.get('email',"rgiraldo@itsinfocom.com")
        rol = request.session.get("rol", ROL_TEST)
        if rol == "PMO-OCU":
            ocupacion = Ocupacion.objects.filter(proyecto__proyecto="PMO ITS").order_by('-id')
        elif rol == "BACKOFFICE-OCU":
            ocupacion = Ocupacion.objects.filter(proyecto__proyecto="BACKOFFICE").order_by('-id')
        elif rol == "ANALISTA" or rol == "GERENTE":
            ocupacion = Ocupacion.objects.filter(proyecto__proyecto__in=["BACKOFFICE", "PMO ITS"]).order_by('-id')

        # ocupacion = Ocupacion.objects.filter(proyecto__proyecto__in=proyectos, email = email).order_by('-id')
        ocupacion_serializer = OcupacionSerializer(ocupacion, many=True)
        return JsonResponse(ocupacion_serializer.data, safe=False)
    elif request.method == 'POST':
        ocupacion_data = JSONParser().parse(request)
        proyecto_id = ocupacion_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = ocupacion_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        ocupacion_serializer = OcupacionSerializer(data=ocupacion_data)
        if ocupacion_serializer.is_valid():
            ocupacion_serializer.save(proyecto=proyecto_instance, periodo=periodo_instance)
            return JsonResponse(ocupacion_serializer.data, status=status.HTTP_201_CREATED)
        return JsonResponse(ocupacion_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@token_required
def ocupacion_detail(request, proyectos, pk):
    try:
        ocupacion = Ocupacion.objects.get(pk=pk)
    except Ocupacion.DoesNotExist:
        return JsonResponse({'message': 'La ocupacion no existe'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        ocupacion_serializer = OcupacionSerializer(ocupacion)
        return JsonResponse(ocupacion_serializer.data)
    elif request.method == 'PUT':
        ocupacion_data = JSONParser().parse(request)
        proyecto_id = ocupacion_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = ocupacion_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        # Envio instancia y la data
        ocupacion_serializer = OcupacionSerializer(ocupacion, data=ocupacion_data)
        if ocupacion_serializer.is_valid():
            ocupacion_serializer.save(proyecto=proyecto_instance,periodo=periodo_instance)
            return JsonResponse(ocupacion_serializer.data)
        return JsonResponse(ocupacion_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        ocupacion.delete()
        return JsonResponse({'message': SUCESS_DELETE})

@api_view(['GET', 'POST'])
@token_required
def hrslabor_list(request, proyectos):
    if request.method == 'GET':
        hrs_labor = HrsLabor.objects.filter(proyecto__proyecto__in=proyectos).order_by('-id')
        hrs_labor_serializer = HrsLaborSerializer(hrs_labor, many=True)
        return JsonResponse(hrs_labor_serializer.data, safe=False)
    elif request.method == 'POST':
        hrs_labor_data = JSONParser().parse(request)
        proyecto_id = hrs_labor_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = hrs_labor_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        hrs_labor_serializer = HrsLaborSerializer(data=hrs_labor_data)
        if hrs_labor_serializer.is_valid():
            hrs_labor_serializer.save(proyecto=proyecto_instance, periodo=periodo_instance)
            return JsonResponse(hrs_labor_serializer.data, status=status.HTTP_201_CREATED)
        return JsonResponse(hrs_labor_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@token_required
def hrslabor_list_new_month(request, proyectos):
    hrs_labor_data = JSONParser().parse(request)
    hrs_labor = HrsLabor.objects.filter(proyecto=hrs_labor_data.get('proyecto'), periodo=hrs_labor_data.get('periodo'))
    print(hrs_labor)
    if len(hrs_labor) == 0:
        return JsonResponse({"code": 400, "msg": "No hay datos para estas fechas"})
    hrs_labor_serializer = HrsLaborSerializer(hrs_labor, many=True)
    return JsonResponse(hrs_labor_serializer.data, safe=False)

@api_view(['POST'])
@token_required
def hrslabor_new_month(request, proyectos):
    res_data = []
    hrs_labor_data = JSONParser().parse(request)
    proyecto_id = hrs_labor_data[0].get("proyecto").get("id")
    proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
    periodo_id = hrs_labor_data[0].get("periodo").get("id")
    periodo_instance = Periodos.objects.filter(id=periodo_id).first()
    for hr_labor in hrs_labor_data:
        del hr_labor["proyecto"]["proyecto"]
        del hr_labor["proyecto"]["proyecto_pais"]
        del hr_labor["periodo"]["periodo"]
        hrs_labor_serializer = HrsLaborSerializer(data=hr_labor)
        if hrs_labor_serializer.is_valid():
            hrs_labor_serializer.save(proyecto=proyecto_instance, periodo=periodo_instance)
            res_data.append(hrs_labor_serializer.data)
    print(res_data)
    return JsonResponse(res_data, safe=False, status=status.HTTP_201_CREATED)

@api_view(['GET', 'PUT', 'DELETE'])
@token_required
def hrs_labor_detail(request, proyectos, pk):
    try:
        hrs_labor = HrsLabor.objects.get(pk=pk)
    except HrsLabor.DoesNotExist:
        return JsonResponse({'message': REGISTER_NOTEXISTS%pk}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        hrs_labor_serializer = HrsLaborSerializer(hrs_labor)
        return JsonResponse(hrs_labor_serializer.data)
    elif request.method == 'PUT':
        hrs_labor_data = JSONParser().parse(request)
        proyecto_id = hrs_labor_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = hrs_labor_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        # Envio instancia y la data
        hrs_labor_serializer = HrsLaborSerializer(hrs_labor, data=hrs_labor_data)
        if hrs_labor_serializer.is_valid():
            hrs_labor_serializer.save(proyecto=proyecto_instance,periodo=periodo_instance)
            return JsonResponse(hrs_labor_serializer.data)
        return JsonResponse(hrs_labor_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        hrs_labor.delete()
        return JsonResponse({'message': SUCESS_DELETE})

@api_view(['GET', 'POST'])
@token_required
def volumetrias_list(request, proyectos):
    if request.method == 'GET':
        volumetrias = Volumetrias.objects.filter(proyecto__proyecto__in=proyectos).order_by('-id')
        volumetrias_serializer = VolumetriasSerializer(volumetrias, many=True)
        return JsonResponse(volumetrias_serializer.data, safe=False)
    elif request.method == 'POST':
        volumetrias_data = JSONParser().parse(request)
        proyecto_id = volumetrias_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = volumetrias_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        backlog_y_registrados, eficiencia = calcular_volumetrias(None, periodo_instance.periodo, proyecto_instance.id, volumetrias_data)
        volumetrias_data['eficiencia'] = eficiencia
        volumetrias_data['backlog_y_registrados'] = backlog_y_registrados
        volumetrias_serializer = VolumetriasSerializer(data=volumetrias_data)
        if volumetrias_serializer.is_valid():
            volumetrias_serializer.save(proyecto=proyecto_instance, periodo=periodo_instance)
            return JsonResponse(volumetrias_serializer.data, status=status.HTTP_201_CREATED)
        return JsonResponse(volumetrias_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@token_required
def volumetrias_list_new_month(request, proyectos):
    volumetrias_data = JSONParser().parse(request)
    volumetrias = Volumetrias.objects.filter(proyecto=volumetrias_data.get('proyecto'), periodo=volumetrias_data.get('periodo'))
    if len(volumetrias) == 0:
        return JsonResponse({"code": 400, "msg": "No hay datos para este Mes y Proyecto"})
    volumetrias_serializer = VolumetriasSerializer(volumetrias, many=True)
    return JsonResponse(volumetrias_serializer.data, safe=False)

@api_view(['POST'])
@token_required
def volumetrias_new_month(request, proyectos):
    res_data = []
    volumetrias_data = JSONParser().parse(request)
    proyecto_id = volumetrias_data[0].get("proyecto").get("id")
    proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
    periodo_id = volumetrias_data[0].get("periodo").get("id")
    periodo_instance = Periodos.objects.filter(id=periodo_id).first()
    for vol in volumetrias_data:
        del vol["proyecto"]["proyecto"]
        del vol["proyecto"]["proyecto_pais"]
        del vol["periodo"]["periodo"]
        backlog_y_registrados, eficiencia = calcular_volumetrias(None, periodo_instance.periodo, proyecto_instance.id, vol)
        vol['eficiencia'] = eficiencia
        vol['backlog_y_registrados'] = backlog_y_registrados
        volumetrias_serializer = VolumetriasSerializer(data=vol)
        if volumetrias_serializer.is_valid():
            volumetrias_serializer.save(proyecto=proyecto_instance, periodo=periodo_instance)
            res_data.append(volumetrias_serializer.data)
    # print(res_data)
    return JsonResponse(res_data, safe=False, status=status.HTTP_201_CREATED)

@api_view(['GET', 'PUT', 'DELETE'])
@token_required
def volumetrias_detail(request, proyectos, pk):
    try:
        volumetria = Volumetrias.objects.get(pk=pk)
    except Volumetrias.DoesNotExist:
        return JsonResponse({'message': REGISTER_NOTEXISTS%pk}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        volumetrias_serializer = VolumetriasSerializer(volumetria)
        return JsonResponse(volumetrias_serializer.data)
    elif request.method == 'PUT':
        volumetria_data = JSONParser().parse(request)
        proyecto_id = volumetria_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = volumetria_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        backlog_y_registrados, eficiencia = calcular_volumetrias(pk, periodo_instance.periodo, proyecto_instance.id, volumetria_data)
        volumetria_data['eficiencia'] = eficiencia
        volumetria_data['backlog_y_registrados'] = backlog_y_registrados
        # Envio instancia y la data
        volumetria_serializer = VolumetriasSerializer(volumetria, data=volumetria_data)
        if volumetria_serializer.is_valid():
            volumetria_serializer.save(proyecto=proyecto_instance,periodo=periodo_instance)
            return JsonResponse(volumetria_serializer.data)
        return JsonResponse(volumetria_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        volumetria.delete()
        return JsonResponse({'message': SUCESS_DELETE})

@api_view(['GET', 'POST'])
@token_required
def ans_list(request, proyectos):
    if request.method == 'GET':
        ans = Ans.objects.filter(proyecto__proyecto__in=proyectos).order_by('-id')
        ans_serializer = AnsSerializer(ans, many=True)
        return JsonResponse(ans_serializer.data, safe=False)
    elif request.method == 'POST':
        ans_data = JSONParser().parse(request)
        proyecto_id = ans_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = ans_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        ans_serializer = AnsSerializer(data=ans_data)
        if ans_serializer.is_valid():
            ans_serializer.save(proyecto=proyecto_instance, periodo=periodo_instance)
            return JsonResponse(ans_serializer.data, status=status.HTTP_201_CREATED)
        return JsonResponse(ans_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@token_required
def ans_list_new_month(request, proyectos):
    ans_data = JSONParser().parse(request)
    ans = Ans.objects.filter(proyecto=ans_data.get('proyecto'), periodo=ans_data.get('periodo'))
    if len(ans) == 0:
        return JsonResponse({"code": 400, "msg": "No hay datos para este Mes y Proyecto"})
    ans_serializer = AnsSerializer(ans, many=True)
    return JsonResponse(ans_serializer.data, safe=False)


@api_view(['POST'])
@token_required
def ans_new_month(request, proyectos):
    res_data = []
    ans_data = JSONParser().parse(request)
    proyecto_id = ans_data[0].get("proyecto").get("id")
    proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
    periodo_id = ans_data[0].get("periodo").get("id")
    periodo_instance = Periodos.objects.filter(id=periodo_id).first()
    for ans in ans_data:
        del ans["proyecto"]["proyecto"]
        del ans["proyecto"]["proyecto_pais"]
        del ans["periodo"]["periodo"]
        ans_serializer = AnsSerializer(data=ans)
        if ans_serializer.is_valid():
            ans_serializer.save(proyecto=proyecto_instance, periodo=periodo_instance)
            res_data.append(ans_serializer.data)
    return JsonResponse(res_data, safe=False, status=status.HTTP_201_CREATED)

@api_view(['GET', 'PUT', 'DELETE'])
@token_required
def ans_detail(request, proyectos, pk):
    try:
        ans = Ans.objects.get(pk=pk)
    except Ans.DoesNotExist:
        return JsonResponse({'message': REGISTER_NOTEXISTS%pk}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        ans_serializer = AnsSerializer(ans)
        return JsonResponse(ans_serializer.data)
    elif request.method == 'PUT':
        ans_data = JSONParser().parse(request)
        proyecto_id = ans_data.get("proyecto").get("id")
        proyecto_instance = Proyectos.objects.filter(id=proyecto_id).first()
        periodo_id = ans_data.get("periodo").get("id")
        periodo_instance = Periodos.objects.filter(id=periodo_id).first()
        # Envio instancia y la data
        ans_serializer = AnsSerializer(ans, data=ans_data)
        if ans_serializer.is_valid():
            ans_serializer.save(proyecto=proyecto_instance,periodo=periodo_instance)
            return JsonResponse(ans_serializer.data)
        return JsonResponse(ans_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        ans.delete()
        return JsonResponse({'message': SUCESS_DELETE})

def calcular_volumetrias(id, periodo, proyecto, data):
    months = {'ENE': 1,'FEB': 2,'MAR': 3,'ABR': 4,'MAY': 5,'JUN': 6,'JUL': 7,'AGO': 8,'SEP': 9,'OCT': 10,'NOV': 11,'DIC': 12}
    month, year  = periodo.split(" -- ")
    pais = data.get('pais')
    servicio = data.get('servicio')
    tipo = data.get('tipo')
    print (pais, servicio, tipo)
    t = date(int(year), months[month], 1)
    f = t - timedelta(1)
    m = [key for key, value in months.items() if value == f.month][0]
    beforeMonth = "%s -- %s"%(m,f.strftime("%Y"))
    try:
        vol = Volumetrias.objects.get(periodo=beforeMonth, pais=pais,servicio=servicio, \
                                       tipo=tipo, proyecto_id=proyecto)
    except Volumetrias.DoesNotExist:
        return None, None
    except Volumetrias.MultipleObjectsReturned:
        vol = Volumetrias.objects.filter(periodo=beforeMonth, pais=pais,servicio=servicio, \
                                       tipo=tipo, proyecto_id=proyecto).first()

    if (id == None or int(id) != vol.id):
        backlog = vol.backlog
        backlog_y_registrados = backlog + int(data.get('registrados'))
        try:
            eficiencia = int(data.get('cerrados')) / backlog_y_registrados * 100
        except ZeroDivisionError:
            return backlog_y_registrados, 0
        return backlog_y_registrados, round(eficiencia, 2)
    else:
        return None, None

@token_required
def index_vue(request, proyectos):
    return render(request, 'index.html', locals())

@api_view(['GET'])
@token_required
def get_user_rol(request, proyectos):
    rol = request.session.get("rol", ROL_TEST)
    if rol == "PMO-OCU":
        usuarios = Usuarios.objects.filter(proyecto__proyecto="PMO ITS")
    elif rol == "BACKOFFICE-OCU":
        usuarios = Usuarios.objects.filter(proyecto__proyecto="BACKOFFICE")
    elif rol == "ANALISTA" or rol == "GERENTE":
        usuarios = Usuarios.objects.filter(proyecto__proyecto__in=["BACKOFFICE", "PMO ITS"])
    
    return JsonResponse(UsersSerializer(usuarios, many=True).data, safe=False)

