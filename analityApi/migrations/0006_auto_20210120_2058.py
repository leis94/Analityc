# Generated by Django 3.1.3 on 2021-01-20 20:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('analityApi', '0005_auto_20210119_2012'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ans',
            name='nso',
            field=models.DecimalField(blank=True, decimal_places=4, max_digits=5, null=True),
        ),
        migrations.AlterField(
            model_name='ans',
            name='nso_dec',
            field=models.DecimalField(blank=True, decimal_places=4, max_digits=10, null=True),
        ),
        migrations.AlterField(
            model_name='ans',
            name='obtenido',
            field=models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True),
        ),
    ]
