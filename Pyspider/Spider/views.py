#coding:utf-8
from django.shortcuts import render
from Spider.models import Movie,Mobile
# Create your views here.
def show_movie(request):
    ctx = {'movie_list': Movie.objects.all()}
    return render(request, 'demo/movie.html', ctx)

def show_mobile(request):
    ctx2 = {'mobile_list': Mobile.objects.all()}
    return render(request, 'demo/mobile.html', ctx2)