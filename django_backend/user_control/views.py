from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.models import Token

from django.contrib.auth import authenticate
from django.utils.text import slugify

from .models import FollowModel, UserModel, ProfileModel
from .serializers import UserModelSerializer, ProfileModelSerializer


@api_view(['GET'])
def get_routes(request):
    routes = [
        'api/blog/',
        'api/blog/<id>/',
        'api/blog/create-note/new',
        'api/blog/update-note/<id>/',
        'api/blog/delete-note/<id>/',

        'api/user/login/',
        'api/user/signup/',
        'api/user/profile/',
        'api/user/profile/update/',
    ]
    return Response(routes)


@api_view(['POST'])
def login_view(request):
    data = request.data
    email = data['email']
    password = data['password']

    try:
        auth_user = authenticate(email=email, password=password)
    except:
        return Response({'error': 'Invalid email or password'}, status=HTTP_400_BAD_REQUEST)
    
    if auth_user is not None:
        token, created = Token.objects.get_or_create(user=auth_user)
        return Response({'token': token.key}, status=HTTP_200_OK)
    else:
        return Response({'error': 'Invalid email or password'}, status=HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def signup_view(request):
    data = request.data
    name = data['name']
    email = data['email']
    password = data['password']

    try:
        user = UserModel.objects.create_user(
            name=name, email=email, password=password)
        slug_str = "%s %s" % (user.name, user.id)
        slug = slugify(slug_str)
        user.slug = slug
        user.save()
        ProfileModel.objects.create(user=user)
        token, created = Token.objects.get_or_create(user=user)
        serialized_data = UserModelSerializer(
            user, many=False).data
        return Response({"token": token.key, "user": serialized_data}, status=HTTP_200_OK)
    except:
        return Response({"error": "User already exists with this Email"}, status=HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def get_user_profile(request):
    user = UserModel.objects.get(id=request.user.id)
    profile = ProfileModel.objects.get(user=user)
    serialized_user_data = UserModelSerializer(user, many=False).data
    serialized_profile_data = ProfileModelSerializer(
        profile, many=False).data
    return Response({"user": serialized_user_data, "profile": serialized_profile_data}, status=HTTP_200_OK)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def follow_user(request):
    data = request.data
    user_id = data['user_id']

    following = UserModel.objects.get(id=user_id)
    follower = request.user
    FollowModel.objects.create(follower=follower, following=following)

    return Response({"message": "User followed"}, status=HTTP_200_OK)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def unfollow_user(request):
    data = request.data
    user_id = data['user_id']

    following = UserModel.objects.get(id=user_id)
    follower = request.user
    FollowModel.objects.get(follower=follower, following=following).delete()

    return Response({"message": "User unfollowed"}, status=HTTP_200_OK)


@api_view(['GET'])
def get_followers(request):
    data = request.data
    user_id = data['user_id']

    user = UserModel.objects.get(id=user_id)
    followers = FollowModel.objects.filter(following=user)
    serialized_data = UserModelSerializer(
        followers, many=True).data

    return Response({"followers": serialized_data}, status=HTTP_200_OK)


@api_view(['GET'])
def get_followings(request):
    data = request.data
    user_id = data['user_id']

    user = UserModel.objects.get(id=user_id)
    following = FollowModel.objects.filter(follower=user)
    serialized_data = UserModelSerializer(
        following, many=True).data

    return Response({"following": serialized_data}, status=HTTP_200_OK)
