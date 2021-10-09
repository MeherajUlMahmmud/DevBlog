from django.db import models
from user_control.models import UserModel


class BlogModel(models.Model):
    author = models.ForeignKey(UserModel, null=True, blank=True, on_delete=models.CASCADE)
    title = models.CharField(max_length=255)
    content = models.TextField()
    category = models.CharField(max_length=255, null=True, blank=True)
    image = models.ImageField(null=True, blank=True)
    date_posted = models.DateTimeField(auto_now_add=True)
    slug = models.SlugField(unique=True, null=True, blank=True)
    likes = models.ImageField(default=0)
    dislikes = models.ImageField(default=0)
    comments = models.ImageField(default=0)
    views = models.IntegerField(default=0)

    def __str__(self):
        return self.title + " by " + self.author.name


class BlogCategoryModel(models.Model):
    category = models.CharField(max_length=255)

    def __str__(self):
        return self.category


class CommentModel(models.Model):
    blog = models.ForeignKey(BlogModel, null=True, blank=True, on_delete=models.CASCADE)
    author = models.ForeignKey(UserModel, null=True, blank=True, on_delete=models.CASCADE)
    content = models.TextField()
    date_posted = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['date_posted']


class BlogLikeModel(models.Model):
    blog = models.ForeignKey(BlogModel, null=True, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey(UserModel, null=True, blank=True, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)


class BlogDislikeModel(models.Model):
    blog = models.ForeignKey(BlogModel, null=True, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey(UserModel, null=True, blank=True, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)


class BlogViewModel(models.Model):
    blog = models.ForeignKey(BlogModel, null=True, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey(UserModel, null=True, blank=True, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)


class CommentLikeModel(models.Model):
    comment = models.ForeignKey(CommentModel, null=True, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey(UserModel, null=True, blank=True, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)


class CommentDislikeModel(models.Model):
    comment = models.ForeignKey(CommentModel, null=True, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey(UserModel, null=True, blank=True, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
