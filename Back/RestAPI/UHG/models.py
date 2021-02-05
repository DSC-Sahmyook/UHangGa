from django.db import models
from django.contrib.auth.models import User


class Post(models.Model):
    title = models.CharField(max_length=200)
    text = models.TextField()


class Characters(models.Model):
    # id = models.IntegerField(primary_key=True)
    character = models.TextField()
    url = models.TextField()
    partner = models.ForeignKey('Characters', on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.character} {self.partner}" #json아이템상세표현

class Profile(models.Model):
    # id = models.IntegerField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phonenum = models.IntegerField(default=0)
    address = models.TextField()
    photourl = models.TextField()
    characterid = models.ForeignKey('Characters', on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.user} {self.phonenum} {self.address} {self.characterid}" #json아이템상세표현

class PostedDogs(models.Model):
    # id = models.IntegerField(primary_key=True)
    date = models.DateTimeField(auto_now_add=True)
    protection = models.CharField(max_length=50)
    dogid = models.ForeignKey('Dogs', on_delete=models.CASCADE)
    dogCharacter = models.ForeignKey('Characters', on_delete=models.CASCADE)
    userid = models.ForeignKey('Profile', on_delete=models.CASCADE)

    # def __str__(self):
    #     return '[{}] {}'.format(self.user.username, self.title)

class CrawledDogs(models.Model):
    # id = models.IntegerField(primary_key=True)
    dogid = models.IntegerField(default=0)
    detailedurl = models.CharField(max_length=50)


class PostedInfo(models.Model):
    # id = models.IntegerField(primary_key=True)
    url = models.CharField(max_length=50)


class Dogs(models.Model):
    # id = models.ForeignKey('PostedDogs', on_delete=models.CASCADE, primary_key=True)
    name = models.CharField(max_length=50)
    dogtype = models.CharField(max_length=50)
    age = models.IntegerField()
    uniqueness = models.CharField(max_length=50)
    photoid = models.IntegerField(default=0)
    isadopted = models.BooleanField(default=0)     # 0: 등록, 1: 입양

    def __str__(self):
        return f"{self.name} {self.dogtype} {self.age} {self.uniqueness} {self.photoid} {self.isadopted}" #json아이템상세표현


class Dogsphotos(models.Model):
    # id = models.IntegerField(primary_key=True)
    url = models.CharField(max_length=50)
    num = models.CharField(max_length=50)
