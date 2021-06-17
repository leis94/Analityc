from django.contrib import admin
from django.contrib.auth.models import Group, User
from .models import Periodos, Proyectos, Multas, Pjs, Ocupacion, \
                        HrsLabor, Volumetrias, Ans, ServiciosAns, ServiciosVol, ServiciosHrsLabor
from login.models import Usuarios
from django.apps import apps

from money import Money

# Register your models here.
# models = apps.get_models()

admin.site.unregister(Group)
admin.site.unregister(User)

@admin.register(Periodos)
class PeriodoAdmin(admin.ModelAdmin):
    list_display = ['periodo', 'trm_co_display', 'trm_hn_display', 'trm_gt_display', 'trm_ni_display',
        'trm_cr_display', 'trm_sv_display'
    ]
    search_fields = ['periodo']

    def trm_co_display(self, obj):
        if obj.trm_co:
            m = Money(obj.trm_co, 'USD')
            print(m.format('en_US'))
            return "{}".format(m)
        return "-"
    
    def trm_hn_display(self, obj):
        if obj.trm_hn:
            m = Money(obj.trm_hn, 'USD')
            print(m.format('en_US'))
            return "{}".format(m)
        return "-"

    def trm_gt_display(self, obj):
        if obj.trm_gt:
            m = Money(obj.trm_gt, 'USD')
            print(m.format('en_US'))
            return "{}".format(m)
        return "-"

    def trm_ni_display(self, obj):
        if obj.trm_ni:
            m = Money(obj.trm_ni, 'USD')
            print(m.format('en_US'))
            return "{}".format(m)
        return "-"

    def trm_cr_display(self, obj):
        if obj.trm_cr:
            m = Money(obj.trm_cr, 'USD')
            print(m.format('en_US'))
            return "{}".format(m)
        return "-"
    
    def trm_sv_display(self, obj):
        if obj.trm_sv:
            m = Money(obj.trm_sv, 'USD')
            print(m.format('en_US'))
            return "{}".format(m)
        return "-"
    
    trm_co_display.short_description = "trm colombia"
    trm_hn_display.short_description = "trm honduras"
    trm_gt_display.short_description = "trm guatemala"
    trm_ni_display.short_description = "trm nicaragua"
    trm_cr_display.short_description = "trm costa rica"
    trm_sv_display.short_description = "trm el salvador"

@admin.register(Proyectos)
class ProyectoAdmin(admin.ModelAdmin):
    list_display = [f.name for f in Proyectos._meta.fields]
    search_fields = ['proyecto']

@admin.register(Pjs)
class PjsAdmin(admin.ModelAdmin):
    list_display = [f.name for f in Pjs._meta.fields]
    search_fields = ['pj']
    list_per_page = 20

@admin.register(ServiciosAns)
class ServiciosAnsAdmin(admin.ModelAdmin):
    list_display = [f.name for f in ServiciosAns._meta.fields]
    search_fields = ['servicio']
    list_filter = ['proyecto']
    list_per_page = 20

@admin.register(ServiciosVol)
class ServiciosVolAdmin(admin.ModelAdmin):
    list_display = [f.name for f in ServiciosVol._meta.fields]
    search_fields = ['servicio']
    list_filter = ['proyecto']
    list_per_page = 20

@admin.register(ServiciosHrsLabor)
class ServiciosHrsLaborAdmin(admin.ModelAdmin):
    list_display = [f.name for f in ServiciosHrsLabor._meta.fields]
    search_fields = ['servicio']
    list_filter = ['proyecto']
    list_per_page = 20

@admin.register(Multas)
class MultasAdmin(admin.ModelAdmin):
    list_display = [ 'periodo', 'pais', 'pj', 'proyecto', \
        'valor_facturacion_display', 'porcentaje_display', 'valor_multa_display', 'trm_display']
    list_filter = ['proyecto', 'pais', 'periodo']

    def trm_display(self, obj):
        if obj.trm:
            m = Money(obj.trm, 'USD')
            return "{}".format(m)
        return "-"
    
    def valor_facturacion_display(self, obj):
        if obj.valor_facturacion:
            m = Money(obj.valor_facturacion, 'USD')
            return "{}".format(m)
        return "-"

    def valor_multa_display(self, obj):
        if obj.valor_multa:
            m = Money(obj.valor_multa, 'USD')
            return "{}".format(m)
        return "-"

    def porcentaje_display(self, obj):
        if obj.porcentaje_multa:
            return "% {}".format(obj.porcentaje_multa)
        return "-"
    
    trm_display.short_description = "trm"
    valor_facturacion_display.short_description = "Valor Facturacion"
    valor_multa_display.short_description = "Valor Multa"
    porcentaje_display.short_description = "% Multa"

@admin.register(Ocupacion)
class OcupacionAdmin(admin.ModelAdmin):
    list_display = ['periodo', 'pais', 'pj', 'proyecto', 'pm', 'cliente', \
                    'dedicacion_display', 'observaciones']
    list_filter = ['proyecto', 'pais', 'periodo']
    
    def dedicacion_display(self, obj):
        if obj.dedicacion:
            return "% {}".format(obj.dedicacion)
        return "-"

    dedicacion_display.short_description = "% Dedicacion"

@admin.register(HrsLabor)
class HrsLaborAdmin(admin.ModelAdmin):
    list_display = ['periodo','pais','proyecto','servicio','linea_base_horas','horas_ejecutadas','uso_display']
    list_filter = ['proyecto', 'pais', 'periodo']

    def uso_display(self, obj):
        if obj.uso:
            return "% {}".format(obj.uso)
        return "-"

    uso_display.short_description = "% uso"

@admin.register(Ans)
class AnsAdmin(admin.ModelAdmin):
    list_display = ['periodo','pais','proyecto','tipo_formato','servicio', \
                    'indicadores_servicio','nso_display','nso_dec','ind_txt', \
                    'obtenido_display','observaciones','cumplimiento_general', 
    ]
    list_filter = ['proyecto', 'pais', 'periodo']

    def nso_display(self, obj):
        if obj.nso:
            return "% {}".format(obj.nso)
        return "-"

    def obtenido_display(self, obj):
        if obj.obtenido:
            return "% {}".format(obj.obtenido)
        return "-"

    nso_display.short_description = "nso"
    obtenido_display.short_description = "obtenido"

@admin.register(Volumetrias)
class VolumetriasAdmin(admin.ModelAdmin):
    list_display = ['periodo','pais','proyecto','servicio','tipo', \
                    'registrados','cerrados','backlog','backlog_y_registrados', 'eficiencia_display']
    list_filter = ['proyecto', 'pais', 'periodo']

    def eficiencia_display(self, obj):
        if obj.eficiencia:
            return "% {}".format(obj.eficiencia)
        return "-"

    eficiencia_display.short_description = "nso"

@admin.register(Usuarios)
class UsuariosAdmin(admin.ModelAdmin):
    list_display = ['nombre', 'email', 'pais']
    search_fields = ('nombre','email', 'pais')
    list_filter = ['pais']

admin.site.site_header = "Portal de Administracion Analitica"
admin.site.site_title = "Administracion Analitica"
admin.site. site_url = "/login"