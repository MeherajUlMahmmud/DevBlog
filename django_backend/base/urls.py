from django.contrib import admin
from django.urls import path, include
from user_control.views import get_routes

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', get_routes),
    path('api/user/', include('user_control.urls')),
    path('api/blog/', include('blog_control.urls')),
]
