from django.shortcuts import render
from .models import Post 

def home(request):
    post = Post.objects.all()
    return render(request, 'home.html', {'post': post})

