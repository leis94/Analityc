# Generated by Django 3.1.3 on 2021-01-05 14:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('analityApi', '0003_auto_20210104_2328'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='ans',
            options={'ordering': ['id'], 'verbose_name': 'Cumplimiento indicadores', 'verbose_name_plural': 'Cumplimiento indicadores'},
        ),
        migrations.AlterModelOptions(
            name='hrslabor',
            options={'ordering': ['id'], 'verbose_name': 'Capacidad y demanda', 'verbose_name_plural': 'Capacidad y demanda'},
        ),
        migrations.AlterModelOptions(
            name='multas',
            options={'ordering': ['id'], 'verbose_name': 'Facturación', 'verbose_name_plural': 'Facturación'},
        ),
        migrations.AlterModelOptions(
            name='volumetrias',
            options={'ordering': ['id'], 'verbose_name': 'Eficiencia en la solución', 'verbose_name_plural': 'Eficiencia en la solución'},
        ),
        migrations.AlterField(
            model_name='ocupacion',
            name='email',
            field=models.EmailField(max_length=254),
        ),
    ]