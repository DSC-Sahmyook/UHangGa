from django.shortcuts import render
from rest_framework import viewsets
from .serializers import PostSerializer
from .models import Post


# Create your views here.
class PostViewset(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer