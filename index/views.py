from django.http import HttpResponse
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from index.models import Sections, Roles, Users, Students, Teachers
from index.serializers import SectionSerializer, RolesSerializer, SectionWithStudentsSerializer, UsersSerializer, \
    StudentsSerializer, StudentDetailSerializer, TeachersSerializer, RolesWithUsersSerializer, UsersDetailSerializer


def create_view(model, serializer_class):
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

def create_detail_view(model, serializer_class):
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


sectionsView = create_view(Sections, SectionSerializer)

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


rolesView = create_view(Roles, RolesSerializer)

@api_view(['GET', 'PUT', 'DELETE'])
def rolesDetailView(request, pk):
    try:
        roles = Roles.objects.get(pk=pk)
    except Roles.DoesNotExist:
        return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = RolesWithUsersSerializer(roles)
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


usersView = create_view(Users, UsersSerializer)

@api_view(['GET', 'PUT', 'DELETE'])
def usersDetailView(request, pk):
    try:
        users = Users.objects.get(pk=pk)
    except Users.DoesNotExist:
        return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = UsersDetailSerializer(users)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = UsersSerializer(users, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        users.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


studentsView = create_view(Students, StudentsSerializer)
studentsDetailView = create_detail_view(Students, StudentDetailSerializer)


teachersView = create_view(Teachers, TeachersSerializer)
teachersDetailView = create_detail_view(Teachers, TeachersSerializer)

