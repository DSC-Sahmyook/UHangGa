from django.contrib import admin
from . models import Characters, Profile, PostedDogs, CrawledDogs, PostedInfo, Dogs, Dogsphotos
# Register your models here.

admin.site.register(Characters)
admin.site.register(Profile)
admin.site.register(PostedDogs)
admin.site.register(CrawledDogs)
admin.site.register(PostedInfo)
admin.site.register(Dogs)
admin.site.register(Dogsphotos)
