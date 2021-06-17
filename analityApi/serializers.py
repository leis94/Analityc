from rest_framework import serializers
from .models import Proyectos, Periodos, Pjs, \
                        Multas, Ocupacion, HrsLabor, \
                            Volumetrias, Ans, ServiciosAns, \
                                ServiciosVol, ServiciosHrsLabor
from login.models import Usuarios
    
class ProyectoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proyectos
        fields = [
            'id',
            'proyecto',
            'proyecto_pais',
        ]
        extra_kwargs = {'proyecto': {'required': False}, 'proyecto_pais': {'required': False}}

class ServiciosAnsSerializer(serializers.ModelSerializer):
    class Meta:
        model = ServiciosAns
        fields = [
            'pais',
            'proyecto',
            'servicio',
            'indicadores_servicio'
        ]

class ServiciosVolSerializer(serializers.ModelSerializer):
    class Meta:
        model = ServiciosAns
        fields = [
            'pais',
            'proyecto',
            'servicio'
        ]

class ServiciosHrsLaborSerializer(serializers.ModelSerializer):
    class Meta:
        model = ServiciosAns
        fields = [
            'pais',
            'proyecto',
            'servicio'
        ]

class PjSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pjs
        fields = [
            'id',
            'pj_pais',
            'pais',
            'nombre_cliente',
        ]
        extra_kwargs = {
            'pj_pais': {'required': False},
            'pais': {'required': False},
            'nombre_cliente': {'required': False}
        }

class PeriodoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Periodos
        fields = [
            'id',
            'periodo',
            'trm_co',
            'trm_cr',
            'trm_gt',
            'trm_hn',
            'trm_ni',
            'trm_sv',
        ]
        extra_kwargs = {'periodo': {'required': False}, 
                        'trm_co': {'required': False},
                        'trm_cr': {'required': False},
                        'trm_gt': {'required': False},
                        'trm_hn': {'required': False},
                        'trm_ni': {'required': False},
                        'trm_sv': {'required': False},
        }

class OcupacionSerializer(serializers.ModelSerializer):
    periodo = PeriodoSerializer()
    proyecto = ProyectoSerializer()

    class Meta:
        model = Ocupacion
        fields = '__all__'
        
class MultasSerializer(serializers.ModelSerializer):
    periodo = PeriodoSerializer()
    proyecto = ProyectoSerializer()
    pj = PjSerializer()
    class Meta:
        model = Multas
        fields = '__all__'

class HrsLaborSerializer(serializers.ModelSerializer):
    periodo = PeriodoSerializer()
    proyecto = ProyectoSerializer()

    class Meta:
        model = HrsLabor
        fields = '__all__'

class VolumetriasSerializer(serializers.ModelSerializer):
    periodo = PeriodoSerializer()
    proyecto = ProyectoSerializer()

    class Meta:
        model = Volumetrias
        fields = '__all__'

class AnsSerializer(serializers.ModelSerializer):
    periodo = PeriodoSerializer()
    proyecto = ProyectoSerializer()

    class Meta:
        model = Ans
        fields = '__all__'
        extra_kwargs = {'observaciones': {'required': False},
                        'ind_txt': {'required': False}}

class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuarios
        fields = [
            'email',
            'nombre',
        ]