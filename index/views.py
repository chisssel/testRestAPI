from django.http import HttpResponse
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken

from index.models import Sections, Roles, Users, Students, Teachers
from index.serializers import SectionSerializer, RolesSerializer, SectionWithStudentsSerializer, UsersSerializer, \
    StudentsSerializer, StudentDetailSerializer, TeachersSerializer, RolesWithUsersSerializer, UsersDetailSerializer, \
    LoginSerializer, UserRegisterSerializer


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

class StudentPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'page_size'
    max_page_size = 100


@api_view(['GET', 'POST'])
def studentsView(request):
    if request.method == 'GET':
        students = Students.objects.all().select_related('user', 'section')

        section_id = request.GET.get('section')
        if section_id:
            students = students.filter(section_id=section_id)

        sort_by = request.GET.get('sort', 'user__last_name')
        if sort_by in ['user__first_name', 'user__last_name', 'student_start_date']:
            students = students.order_by(sort_by)

        paginator = StudentPagination()
        result_page = paginator.paginate_queryset(students, request)
        serializer = StudentsSerializer(result_page, many=True)

        return paginator.get_paginated_response(serializer.data)

    elif request.method == 'POST':
        serializer = StudentsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


studentsDetailView = create_detail_view(Students, StudentDetailSerializer)


teachersView = create_view(Teachers, TeachersSerializer)
teachersDetailView = create_detail_view(Teachers, TeachersSerializer)


@api_view(['POST'])
@permission_classes([AllowAny])
def login_view(request):
    serializer = LoginSerializer(data=request.data)

    if serializer.is_valid():
        user = serializer.validated_data['user']

        refresh = RefreshToken.for_user(user)

        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
            'user': {
                'id': user.id,
                'username': user.username,
                'email': user.email,
                'first_name': user.first_name,
                'last_name': user.last_name,
                'role': user.role.role_name if user.role else None
            }
        })

    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes([AllowAny])
def register_view(request):
    serializer = UserRegisterSerializer(data=request.data)

    if serializer.is_valid():
        user = serializer.save()

        refresh = RefreshToken.for_user(user)

        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
            'user': {
                'id': user.id,
                'username': user.username,
                'email': user.email,
                'first_name': user.first_name,
                'last_name': user.last_name,
                'role': user.role.role_name if user.role else None
            }
        }, status=status.HTTP_201_CREATED)

    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes([AllowAny])
def logout_view(request):
    try:
        refresh_token = request.data.get('refresh_token')
        token = RefreshToken(refresh_token)
        token.blacklist()
        return Response({"message": "Successfully logged out"}, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def current_user_view(request):
    user = request.user
    return Response({
        'id': user.id,
        'username': user.username,
        'email': user.email,
        'first_name': user.first_name,
        'last_name': user.last_name,
        'role': user.role.role_name if user.role else None
    })