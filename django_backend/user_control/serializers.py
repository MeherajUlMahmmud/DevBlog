from rest_framework import serializers
from .models import UserModel, ProfileModel


class UserModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserModel
        fields = ['id', 'name', 'email', 'slug', 'is_active']


class ProfileModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProfileModel
        fields = "__all__"
