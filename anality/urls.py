from django.contrib import admin
from django.urls import path, re_path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    re_path(r'^', include('analityApi.urls')),
    re_path(r'^', include('login.urls')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
