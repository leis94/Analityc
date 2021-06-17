from django.urls import path, re_path, include
from . import views 
 
urlpatterns = [
    path('login/', views.login, name='login'),
    # path('import_pjs', views.importPjs, name='pjs'),
    path('gettoken/', views.gettoken, name='gettoken'),
    path('get_user_data/', views.get_user_data),
    path('logout/', views.logout, name='logout'),
]