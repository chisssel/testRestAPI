from django.http import HttpResponse
from django.shortcuts import render

def indexView(request):
    return HttpResponse('Hello World!')

# def sectionView(request):
#     return