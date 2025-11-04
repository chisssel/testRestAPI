from rest_framework import serializers
from .models import Sections, Roles, Users, Students


class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sections
        fields = '__all__'

class UserShortSerializer(serializers.ModelSerializer):
    role_name = serializers.CharField(source='role.role_name', read_only=True)
    class Meta:
        model = Users
        fields = ['id', 'username', 'first_name', 'last_name', 'patronymic', 'role_name']

class StudentDetailSerializer(serializers.ModelSerializer):
    user_details = UserShortSerializer(source='user', read_only=True)
    class Meta:
        model = Students
        fields = ['id', 'user', 'user_details', 'student_start_date', 'student_end_date']

class SectionWithStudentsSerializer(serializers.ModelSerializer):
    students = serializers.SerializerMethodField()
    students_count = serializers.SerializerMethodField()
    active_students_count = serializers.SerializerMethodField()
    class Meta:
        model = Sections
        fields = ['id','section_name','students_count','active_students_count','students']

    def get_students(self, obj):
        students = Students.objects.filter(section = obj).select_related('user__role')
        return StudentDetailSerializer(students, many = True).data

    def get_students_count(self, obj):
        return Students.objects.filter(section=obj).count()

    def get_active_students_count(self, obj):
        return Students.objects.filter(section=obj, student_end_date__isnull = True).count()


class RolesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Roles
        fields = '__all__'
