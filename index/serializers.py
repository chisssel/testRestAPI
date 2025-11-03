from rest_framework import serializers
from .models import Sections

class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sections
        fields = '__all__'