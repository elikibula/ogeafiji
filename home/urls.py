from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('tubesara/', views.tubesara_view, name='tubesara'),
    path('mata/', views.mata_view, name='mata'),
    path('tu-tu/', views.tutu_view, name='tutu'),
    path('ogea/', views.ogea_view, name='ogea'),
    
]