from django.contrib.auth.base_user import BaseUserManager, AbstractBaseUser
from django.db import models


# User manager for the User Model
class MyUserManager(BaseUserManager):
    def create_user(self, email, name, password=None):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError('Must have an email address')

        if not name:
            raise ValueError('Must have a name')

        user = self.model(
            email=self.normalize_email(email),
            name=name,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, name, password):
        """
        Creates and saves a superuser with the given email and password.
        """
        user = self.create_user(
            email=self.normalize_email(email),
            name=name,
            password=password,
        )
        user.is_staff = True
        user.is_admin = True
        user.save(using=self._db)
        return user


class UserModel(AbstractBaseUser):
    email = models.EmailField(max_length=255, unique=True)
    name = models.CharField(max_length=250)
    slug = models.CharField(max_length=255, null=True, blank=True)
    token = models.CharField(max_length=255, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    date_joined = models.DateTimeField(auto_now_add=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name']  # Email & Password are required by default.

    objects = MyUserManager()

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True


class ProfileModel(models.Model):
    user = models.OneToOneField(UserModel, on_delete=models.CASCADE)
    bio = models.CharField(max_length=255, null=True, blank=True)
    image = models.ImageField(null=True, blank=True)
    gender = models.CharField(max_length=10, null=True, blank=True)
    date_of_birth = models.DateField(null=True, blank=True)
    followers = models.IntegerField(default=0)
    followings = models.IntegerField(default=0)
    view_count = models.IntegerField(default=0)

    def __str__(self):
        return self.user.name


class ProfileViewModel(models.Model):
    viewer = models.ForeignKey(UserModel, on_delete=models.CASCADE, related_name='viewer')
    viewed = models.ForeignKey(UserModel, on_delete=models.CASCADE, related_name='viewed')
    timestamp = models.DateTimeField(auto_now_add=True)


class FollowModel(models.Model):
    follower = models.ForeignKey(UserModel, on_delete=models.CASCADE, related_name='follower')
    following = models.ForeignKey(UserModel, on_delete=models.CASCADE, related_name='following')
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.follower.name + ' follows ' + self.following.name
