# Generated by Django 3.1.6 on 2021-03-29 23:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('UHG', '0002_auto_20210329_2309'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dogsphotos',
            name='url',
            field=models.CharField(max_length=500),
        ),
    ]
