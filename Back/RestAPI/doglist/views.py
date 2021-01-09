from django.shortcuts import render
from django.http import HttpResponse
from .models import doglist

# Create your views here.

def index(request):
    return HttpResponse("doglist입니다.")

def create(request):
  doglist = Doglist()
  doglist.title = request.GET.get('title')
  doglist.content = request.GET.get('content')
  doglist.save()
  return redirect('/article/')

