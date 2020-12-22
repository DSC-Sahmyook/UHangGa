from django.db import models

# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=200)
    text = models.TextField()

class Characters(models.Model):
    id = models.IntegerField(primary_key=True)
    character = models.TextField()
    url = models.TextField()

class Users(models.Model):
    id = models.IntegerField(primary_key=True)
    idname = models.CharField(max_length=50)
    pw = models.CharField(max_length=50)
    firstname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    phonenum = models.IntegerField(default=0)
    address = models.TextField()
    photourl = models.TextField()
    characterid = models.ForeignKey('Characters', on_delete=models.CASCADE)

class PostedDogs(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateTimeField(auto_now_add=True)
    protection = models.CharField(max_length=50)
    dogid = models.ForeignKey('Characters', on_delete=models.CASCADE)
    userid = models.ForeignKey('Users', on_delete=models.CASCADE)

class CrawledDogs(models.Model):
    id = models.IntegerField(primary_key=True)
    dogid = models.IntegerField(default=0)
    detailedurl = models.CharField(max_length=50)

class PostedInfo(models.Model):
    id = models.IntegerField(primary_key=True)
    url = models.CharField(max_length=50)

class Dogs(models.Model):
    id = models.ForeignKey('PostedDogs', on_delete=models.CASCADE, primary_key=True)
    name = models.CharField(max_length=50)
    dogtype = models.CharField(max_length=50)
    age = models.CharField(max_length=50)
    uniqueness = models.CharField(max_length=50)
    photoid = models.IntegerField(default=0)

class Dogsphotos(models.Model):
    id = models.IntegerField(primary_key=True)
    url = models.CharField(max_length=50)
    num = models.CharField(max_length=50)
    


