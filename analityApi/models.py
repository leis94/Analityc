from django.core.exceptions import ValidationError
from django.db import models

# Create your models here.

PAISES = (
    ('COLOMBIA', 'COLOMBIA'),
    ('COSTA RICA', 'COSTA RICA'),
    ('GUATEMALA', 'GUATEMALA'),
    ('HONDURAS', 'HONDURAS'),
    ('NICARAGUA', 'NICARAGUA'),
    ('EL SALVADOR', 'EL SALVADOR'),
)
SEMANAS = (
    ('S1', 'S1'),
    ('S2', 'S2'),
    ('S3', 'S3'),
    ('S4', 'S4'),
    ('S5', 'S5'),
)

def validate_cero(value):
    if value == 0:
        raise ValidationError('%(value)s no puede ser = 0',params={'value': value})

class Proyectos(models.Model):
    proyecto = models.CharField(max_length=100)
    pais = models.CharField(max_length=100, default="COLOMBIA", choices=PAISES)
    formulario_ocupacion = models.BooleanField(default=False)

    def __str__(self):
        return "%s -- %s"%(self.proyecto, self.pais)

    @property
    def proyecto_pais(self):
        return "%s -- %s"%(self.proyecto, self.pais)

    class Meta:
        db_table = "proyectos"
        verbose_name_plural = 'Proyectos'
        ordering = ['id']
        constraints = [
            models.UniqueConstraint(fields=['proyecto', 'pais'], name='unique_proyecto_pais')
        ]

class Periodos(models.Model):
    periodo = models.CharField(max_length=20, unique=True)
    trm_co = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    trm_cr = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    trm_gt = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    trm_hn = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    trm_ni = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    trm_sv = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)

    def __str__(self):
        return self.periodo

    class Meta:
        db_table = "periodos"
        verbose_name_plural = 'Periodos'
        ordering = ['id']

class ServiciosAns(models.Model):
    pais = models.CharField(max_length=100, default="COLOMBIA", choices=PAISES)
    proyecto = models.ForeignKey(Proyectos, on_delete=models.SET_NULL, null=True)
    servicio = models.CharField(max_length=250)
    indicadores_servicio = models.CharField(max_length=250, null=True, blank=True)

    def __str__(self):
        return self.servicio 

    class Meta:
        db_table = 'servicios_ans'
        managed = True
        verbose_name = 'Servicios ANS'
        verbose_name_plural = 'Servicios ANS'
        ordering = ['id']

class ServiciosVol(models.Model):
    pais = models.CharField(max_length=100, default="COLOMBIA", choices=PAISES)
    proyecto = models.ForeignKey(Proyectos, on_delete=models.SET_NULL, null=True)
    servicio = models.CharField(max_length=250)

    def __str__(self):
        return self.servicio 

    class Meta:
        db_table = 'servicios_vol'
        managed = True
        verbose_name = 'Servicios Vol'
        verbose_name_plural = 'Servicios Vol'
        ordering = ['id']

class ServiciosHrsLabor(models.Model):
    pais = models.CharField(max_length=100, default="COLOMBIA", choices=PAISES)
    proyecto = models.ForeignKey(Proyectos, on_delete=models.SET_NULL, null=True)
    servicio = models.CharField(max_length=250)

    def __str__(self):
        return self.servicio 

    class Meta:
        db_table = 'servicios_hrsLabor'
        managed = True
        verbose_name = 'Servicios Horas Labor'
        verbose_name_plural = 'Servicios Horas Labor'
        ordering = ['id']

class Pjs(models.Model):
    pj = models.CharField(max_length=30)
    pais = models.CharField(max_length=100, default="COLOMBIA", choices=PAISES)
    ebc = models.CharField(max_length=30, null=True, blank=True)
    nombre_cliente = models.CharField(max_length=100, null=True, blank=True)
    unidad = models.CharField(max_length=5, null=True, blank=True)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return self.pj

    @property
    def pj_pais(self):
        return "%s -- %s"%(self.pj, self.pais)
    
    class Meta:
        db_table = 'pjs'
        verbose_name = 'Pjs'
        verbose_name_plural = 'Pjs'
        ordering = ['id']
        constraints = [
            models.UniqueConstraint(fields=['pj', 'pais'], name='unique_pj')
        ]

class Ans(models.Model):
    periodo = models.ForeignKey(Periodos, on_delete=models.SET_NULL, null=True, to_field="periodo")
    pais = models.CharField(max_length=20,choices=PAISES, default="COLOMBIA")
    proyecto = models.ForeignKey(Proyectos, on_delete=models.SET_NULL, null=True)
    tipo_formato = models.CharField(max_length=100)
    servicio = models.CharField(max_length=100)
    indicadores_servicio = models.CharField(max_length=200)
    nso = models.DecimalField(max_digits=14, decimal_places=4, null=True, blank=True)
    nso_dec = models.DecimalField(max_digits=14, decimal_places=4, null=True, blank=True)
    ind_txt = models.CharField(max_length=10, null=True, blank=True)
    obtenido = models.DecimalField(max_digits=14, decimal_places=4, null=True, blank=True)
    observaciones = models.CharField(max_length=250, null=True, blank=True)
    cumplimiento_general = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'ans'
        verbose_name = 'Cumplimiento indicadores'
        verbose_name_plural = 'Cumplimiento indicadores'
        ordering = ['id']

class Volumetrias(models.Model):
    periodo = models.ForeignKey(Periodos, on_delete=models.SET_NULL, null=True, to_field="periodo")
    pais = models.CharField(max_length=20,choices=PAISES, default="COLOMBIA")
    proyecto = models.ForeignKey(Proyectos, on_delete=models.SET_NULL, null=True)
    servicio = models.CharField(max_length=100)
    tipo = models.CharField(max_length=100)
    registrados = models.IntegerField(null=True, blank=True)
    cerrados = models.IntegerField(null=True, blank=True)
    backlog = models.IntegerField(null=True, blank=True)
    backlog_y_registrados = models.IntegerField(null=True, blank=True)
    eficiencia = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'volumetrias'
        verbose_name = 'Eficiencia en la solución'
        verbose_name_plural = 'Eficiencia en la solución'
        ordering = ['id']

class HrsLabor(models.Model):
    periodo = models.ForeignKey(Periodos, on_delete=models.SET_NULL, null=True, to_field="periodo")
    pais = models.CharField(max_length=20,choices=PAISES, default="COLOMBIA")
    proyecto = models.ForeignKey(Proyectos, on_delete=models.SET_NULL, null=True, blank=True)
    servicio = models.CharField(max_length=100)
    linea_base_horas = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    horas_ejecutadas = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    uso = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'horas_labor'
        verbose_name = 'Capacidad y demanda'
        verbose_name_plural = 'Capacidad y demanda'
        ordering = ['id']

class Ocupacion(models.Model):
    periodo = models.ForeignKey(Periodos, on_delete=models.SET_NULL, null=True, to_field="periodo")
    pais = models.CharField(max_length=20,choices=PAISES, default="COLOMBIA")
    pj = models.ForeignKey(Pjs, on_delete=models.SET_NULL, null=True, blank=True)
    proyecto = models.ForeignKey(Proyectos, on_delete=models.SET_NULL, null=True)
    pm = models.CharField(max_length=100, null=True, blank=True)
    cliente = models.CharField(max_length=100, null=True, blank=True)
    dedicacion = models.DecimalField(max_digits=12, decimal_places=2)
    observaciones = models.CharField(max_length=255, null=True, blank=True)
    email = models.EmailField()

    class Meta:
        db_table = 'ocupacion'
        verbose_name = 'Ocupación PMO y BackOffice'
        verbose_name_plural = 'Ocupación PMO y BackOffice'
        ordering = ['id']

class Multas(models.Model):
    periodo = models.ForeignKey(Periodos, on_delete=models.SET_NULL, null=True, to_field="periodo")
    pais = models.CharField(max_length=20,choices=PAISES, default="COLOMBIA")
    pj = models.ForeignKey(Pjs, on_delete=models.SET_NULL, null=True, blank=True)
    proyecto = models.ForeignKey(Proyectos, on_delete=models.SET_NULL, null=True)
    valor_facturacion = models.DecimalField(max_digits=12, decimal_places=2,validators=[validate_cero])
    porcentaje_multa = models.DecimalField(max_digits=12, decimal_places=2)
    valor_multa = models.DecimalField(max_digits=12, decimal_places=2)
    trm = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'multas'
        verbose_name = 'Facturación'
        verbose_name_plural = 'Facturación'
        ordering = ['id']
