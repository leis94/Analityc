from django.db import models
from analityApi.models import Proyectos
from multiselectfield import MultiSelectField

# Create your models here.

ROL = (
	('PMO', 'PMO'),
	('ANALISTA', 'ANALISTA'),
	('GERENTE', 'GERENTE'),
	('PMO-OCU', 'PMO-OCU'),
	('BACKOFFICE-OCU', 'BACKOFFICE-OCU'),
)

PERMISOS = (
	( 'rw', 'Lectura y Escritura'),
	( 'r', 'Lectura')
)

PAISES = (
  ('COLOMBIA', 'COLOMBIA'),
  ('COSTA RICA', 'COSTA RICA'),
  ('GUATEMALA', 'GUATEMALA'),
  ('HONDURAS', 'HONDURAS'),
  ('NICARAGUA', 'NICARAGUA'),
  ('EL SALVADOR', 'EL SALVADOR'),
)

FORMULARIOS = (
	('TODOS', 'TODOS'),
	('Ans', 'Ans'),
	('Volumetrias', 'Volumetrias'),
	('HrsLabor', 'HrsLabor'),
	('Ocupacion', 'Ocupacion'),
	('Multas', 'Multas'),
)

class Usuarios(models.Model):
	nombre = models.CharField(max_length=50)
	email = models.EmailField(unique=True)
	rol = models.CharField(max_length=20,choices=ROL, default="OCUPACION")
	proyecto = models.ManyToManyField(Proyectos)
	permisos = models.CharField(max_length=20,choices=PERMISOS, default=1)
	pais = MultiSelectField(max_length=100,choices=PAISES, default="COLOMBIA")
	formularios = MultiSelectField(max_length=200, choices=FORMULARIOS, default="Ocupacion")

	def __str__(self):
		return self.email

	class Meta:
		db_table = 'usuarios'
		verbose_name = 'Usuarios'
		verbose_name_plural = 'Usuarios'
