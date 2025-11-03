from django.http import HttpResponse
from django.shortcuts import render
from rest_framework import status, viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response

from index.models import Sections, Roles
from index.serializers import SectionSerializer, RolesSerializer


def create_list_view(model, serializer_class):
    @api_view(['GET', 'POST'])
    def view(request):
        if request.method == 'GET':
            items = model.objects.all()
            serializer = serializer_class(items, many=True)
            return Response(serializer.data)
        elif request.method == 'POST':
            serializer = serializer_class(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    return view

def detail_view(model, serializer_class):
    @api_view(['GET', 'PUT', 'DELETE'])
    def view(request, pk):
        try:
            item = model.objects.get(pk=pk)
        except model.DoesNotExist:
            return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

        if request.method == 'GET':
            serializer = serializer_class(item)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = serializer_class(item, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif request.method == 'DELETE':
            item.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

    return view


def indexView(request):
    return HttpResponse('Hello World!')


sectionsView = create_list_view(Sections, SectionSerializer)
sectionDetailView = detail_view(Sections, SectionSerializer)
rolesView = create_list_view(Roles, RolesSerializer)
rolesDetailView = detail_view(Roles, RolesSerializer)