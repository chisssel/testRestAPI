from django.contrib import admin

from index.models import Sections, Roles, Users, Students, Teachers

admin.site.register(Sections)
admin.site.register(Roles)
admin.site.register(Users)
admin.site.register(Students)
admin.site.register(Teachers)