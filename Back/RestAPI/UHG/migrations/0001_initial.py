# Generated by Django 3.1.5 on 2021-01-13 22:21

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Characters',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('character', models.TextField()),
                ('url', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='CrawledDogs',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dogid', models.IntegerField(default=0)),
                ('detailedurl', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Dogs',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('dogtype', models.CharField(max_length=50)),
                ('age', models.CharField(max_length=50)),
                ('uniqueness', models.CharField(max_length=50)),
                ('photoid', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Dogsphotos',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('url', models.CharField(max_length=50)),
                ('num', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('text', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='PostedInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('url', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('phonenum', models.IntegerField(default=0)),
                ('address', models.TextField()),
                ('photourl', models.TextField()),
                ('characterid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='UHG.characters')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='PostedDogs',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('protection', models.CharField(max_length=50)),
                ('dogid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='UHG.characters')),
                ('userid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='UHG.profile')),
            ],
        ),
    ]
