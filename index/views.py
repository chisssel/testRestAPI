from django.http import HttpResponse
from django.shortcuts import render
from rest_framework import status, viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response

from index.models import Sections, Roles
from index.serializers import SectionSerializer, RolesSerializer, SectionWithStudentsSerializer


def indexView(request):
    return HttpResponse('Hello World!')


@api_view(['GET', 'POST'])
def sectionsView(request):
    if request.method == 'GET':
        sections = Sections.objects.all()
        serializer = SectionSerializer(sections, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = SectionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def sectionDetailView(request, pk):
    try:
       section = Sections.objects.get(pk=pk)
    except Sections.DoesNotExist:
       return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = SectionWithStudentsSerializer(section)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = SectionSerializer(section, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        section.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['GET', 'POST'])
def rolesView(request):
    if request.method == 'GET':
        roles = Roles.objects.all()
        serializer = RolesSerializer(roles, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = RolesSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def rolesDetailView(request, pk):
    try:
        roles = Roles.objects.get(pk=pk)
    except Roles.DoesNotExist:
        return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = RolesSerializer(roles)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = RolesSerializer(roles, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        roles.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

