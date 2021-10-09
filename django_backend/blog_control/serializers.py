from rest_framework import fields, serializers
from .models import *


class BlogModelSerializer(serializers.Serializer):
    class Meta:
        model = BlogModel
        fields = "__all__"


class BlogCategoryModelSerializer(serializers.Serializer):
    class Meta:
        model = BlogCategoryModel
        fields = "__all__"


class CommentModelSerializer(serializers.Serializer):
    class Meta:
        model = CommentModel
        fields = "__all__"
