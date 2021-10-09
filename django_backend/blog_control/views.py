from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST
from rest_framework.decorators import api_view
from rest_framework.authtoken.models import Token

from django.contrib.auth import authenticate
from django.utils.text import slugify

from user_control.serializers import *
from blog_control.serializers import *
from blog_control.models import *
from user_control.models import *


@api_view(['GET'])
def get_blogs(request):
    user = request.user
    if user.is_authenticated:
        # get the blogs from users the user follows
        followings = FollowModel.objects.filter(follower=user)
        blogs = []
        for following in followings:
            blogs.append(
                BlogModel.objects.first(
                    author=following
                )
            )
        serialized_data = BlogModelSerializer(blogs, many=True).data
        return Response(serialized_data, status=HTTP_200_OK)
    else:
        blogs = BlogModel.objects.all()[:20].order_by(
            field_names=['-date_posted']).list()
        serialized_data = BlogModelSerializer(blogs, many=True).data
        return Response(serialized_data, status=HTTP_200_OK)


@api_view(['POST'])
def create_blog(request):
    user = request.user
    if user.is_authenticated:
        serialized_data = BlogModelSerializer(data=request.data)
        if serialized_data.is_valid():
            serialized_data.save(author=user)
            return Response(serialized_data.data, status=HTTP_200_OK)
        else:
            return Response(serialized_data.errors, status=HTTP_400_BAD_REQUEST)
    else:
        return Response(status=HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def get_blog(request, blog_id):
    blog = BlogModel.objects.get(id=blog_id)
    comments = CommentModel.objects.filter(blog=blog)
    serialized_blog_data = BlogModelSerializer(blog, many=False).data
    serialized_comment_data = CommentModelSerializer(comments, many=True).data
    return Response(serialized_blog_data, serialized_comment_data, status=HTTP_200_OK)


@api_view(['POST'])

def create_comment(request, blog_id):
    data = request.data
    user = request.user

