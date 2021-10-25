from django.core.files.base import ContentFile
import base64

from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND
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
        user = UserModel.objects.get(user=auth_user)
        profile = ProfileModel.objects.get(user=user)

        serialized_user_data = UserModelSerializer(user).data
        serialized_profile_data = ProfileModelSerializer(profile).data
        return Response({'user': serialized_user_data, 'profile': serialized_profile_data}, status=HTTP_200_OK)
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
        token, created = Token.objects.get_or_create(user=user)
        user.token = token.key
        user.save()
        profile = ProfileModel.objects.create(user=user)

        serialized_user_data = UserModelSerializer(user, many=False).data
        serialized_profile_data = ProfileModelSerializer(
            profile, many=False).data
        return Response({'user': serialized_user_data, 'profile': serialized_profile_data}, status=HTTP_200_OK)
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

    following_user = UserModel.objects.get(id=user_id)
    follower_user = request.user
    FollowModel.objects.create(
        follower=follower_user, following=following_user)

    following_user_profile = ProfileModel.objects.get(user=following_user)
    following_user_profile.followers += 1
    following_user_profile.save()

    follower_user_profile = ProfileModel.objects.get(user=follower_user)
    follower_user_profile.followings += 1
    follower_user_profile.save()

    return Response({"message": "You're following " + follower_user.name}, status=HTTP_200_OK)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def unfollow_user(request):
    data = request.data
    user_id = data['user_id']

    following_user = UserModel.objects.get(id=user_id)
    follower_user = request.user
    FollowModel.objects.get(
        follower=follower_user, following=following_user).delete()

    following_user_profile = ProfileModel.objects.get(user=following_user)
    following_user_profile.followers -= 1
    following_user_profile.save()

    follower_user_profile = ProfileModel.objects.get(user=follower_user)
    follower_user_profile.followers -= 1
    follower_user_profile.save()

    return Response({"message": "Unfollowed " + following_user.name}, status=HTTP_200_OK)


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


@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def update_user(request):  # edit profile view
    data = request.data
    name = data['name']
    email = data['email']

    try:
        user = UserModel.objects.get(id=request.user.id)
        if user.name != name:
            user.name = name

        if user.email != email:
            user.email = email

        user.save()

        user = UserModel.objects.get(id=request.user.id)
        profile = ProfileModel.objects.get(user=user)

        serialized_user_data = UserModelSerializer(user, many=False).data
        serialized_profile_data = ProfileModelSerializer(
            profile, many=False).data
        return Response({"user": serialized_user_data, "profile": serialized_profile_data}, status=HTTP_200_OK)
    except:
        return Response(status=HTTP_404_NOT_FOUND)


@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def update_profile(request):
    data = request.data
    bio = data['bio']
    gender = data['gender']
    date_of_birth = data['date_of_birth']

    user = UserModel.objects.get(id=request.user.id)
    profile = ProfileModel.objects.get(user=user)
    profile.bio = bio
    profile.gender = gender
    profile.date_of_birth = date_of_birth
    profile.save()

    profile = ProfileModel.objects.get(user=user)

    serialized_user_data = UserModelSerializer(user, many=False).data
    serialized_profile_data = ProfileModelSerializer(
        profile, many=False).data
    return Response({"user": serialized_user_data, "profile": serialized_profile_data}, status=HTTP_200_OK)


@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def update_profile_image(request):
    data = request.data
    file = data["file"]
    name = data["name"]

    image_file = ContentFile(base64.b64decode(file), name)

    user = UserModel.objects.get(id=request.user.id)
    profile = ProfileModel.objects.get(user=user)
    profile.image = image_file
    profile.save()
    profile = ProfileModel.objects.get(user=user)

    serialized_user_data = UserModelSerializer(
        user, many=False).data
    serialized_profile_data = ProfileModelSerializer(
        profile, many=False).data
    return Response({"user": serialized_user_data, "profile": serialized_profile_data}, status=HTTP_200_OK)


@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def update_password(request):
    data = request.data
    old_password = data['old_password']
    new_password = data['new_password']
    try:
        user = UserModel.objects.get(id=request.user.id)
        auth = authenticate(email=user.email, password=old_password)
        if auth:
            user.set_password(new_password)
            user.save()
            return Response({"message": "Password updated successfully"}, status=HTTP_200_OK)
        else:
            return Response({"message": "Old password is incorrect"}, status=HTTP_400_BAD_REQUEST)
    except:
        return Response({"message": "Error occured"}, status=HTTP_400_BAD_REQUEST)
