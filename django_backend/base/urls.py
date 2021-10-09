from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/user/', include('user_control.urls')),
    path('api/blog/', include('blog_control.urls')),
]
