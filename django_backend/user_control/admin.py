from django.contrib import admin
from .models import UserModel, ProfileModel

admin.site.register(UserModel)
admin.site.register(ProfileModel)
