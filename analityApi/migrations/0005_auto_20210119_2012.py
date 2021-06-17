# Generated by Django 3.1.3 on 2021-01-19 20:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('analityApi', '0004_auto_20210105_1458'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Servicios',
            new_name='ServiciosAns',
        ),
        migrations.AlterModelOptions(
            name='serviciosans',
            options={'managed': True, 'ordering': ['id'], 'verbose_name': 'Servicios ANS', 'verbose_name_plural': 'Servicios ANS'},
        ),
        migrations.AlterModelTable(
            name='serviciosans',
            table='servicios_ans',
        ),
        migrations.CreateModel(
            name='ServiciosVol',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pais', models.CharField(choices=[('COLOMBIA', 'COLOMBIA'), ('COSTA RICA', 'COSTA RICA'), ('GUATEMALA', 'GUATEMALA'), ('HONDURAS', 'HONDURAS'), ('NICARAGUA', 'NICARAGUA'), ('EL SALVADOR', 'EL SALVADOR')], default='COLOMBIA', max_length=100)),
                ('servicio', models.CharField(max_length=250)),
                ('proyecto', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='analityApi.proyectos')),
            ],
            options={
                'verbose_name': 'Servicios Vol',
                'verbose_name_plural': 'Servicios Vol',
                'db_table': 'servicios_vol',
                'ordering': ['id'],
                'managed': True,
            },
        ),
    ]
