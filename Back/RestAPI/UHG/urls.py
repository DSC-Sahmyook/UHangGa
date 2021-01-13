from django.urls import path
from . import views

urlpatterns = [
    # Auth
    path('auth/signup/', views.signup),
    path('auth/signin/', views.signin),
    path('auth/logout/', views.logout),
]