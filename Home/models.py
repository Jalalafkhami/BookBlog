from django.db import models
from django.contrib.auth.models import User

class Post(models.Model):
    titale = models.CharField(max_length=255)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    body = models.TextField()

    def __str__(self):
        return self.titale + ' | ' + str(self.author)
