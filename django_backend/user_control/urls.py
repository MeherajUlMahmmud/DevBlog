from django.urls import path
from .views import *

urlpatterns = [
    path('login/', login_view),
    path('signup/', signup_view),
    path('get_user_profile/', get_user_profile),
    path('follow_user/<str:id>/', follow_user),
    path('unfollow_user/<str:id>/', unfollow_user),
    path('get_followers/<str:id>/', get_followers),
    path('get_followings/<str:id>/', get_followings),
    path('update_user/', update_user),
    path('update_profile/', update_profile),
    path('update_profile_image/', update_profile_image),
    path('update_password/', update_password),
]
