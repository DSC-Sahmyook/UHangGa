from django.urls import path, include
from . import views
from rest_framework.urlpatterns import format_suffix_patterns
from .views import PostView

post_list = PostView.as_view({
    'post': 'create',
    'get': 'list'
})
post_detail = PostView.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})

urlpatterns = format_suffix_patterns([
    # Auth
    path('auth/signup/', views.signup),
    path('auth/signin/', views.signin),
    path('auth/logout/', views.logout),

    # Main
    path('main/index/', views.main),
    path('posts/', post_list, name='post_list'),
    path('posts/<int:pk>/', post_detail, name='post_detail'),
])
