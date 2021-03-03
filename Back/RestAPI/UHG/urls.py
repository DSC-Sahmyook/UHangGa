from django.urls import path, include
from . import views
from rest_framework.urlpatterns import format_suffix_patterns
from .views import PostView

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
    path('main/index/data/', views.main_data),
    path('main/index/list/', views.main_list),
    path('posts/', views.posteddogslist),
    path('posts/<int:pk>/', post_detail, name='post_detail'),

    # MBTI
    path('mbti/result/dog/', views.resultOfMBTI),
])
