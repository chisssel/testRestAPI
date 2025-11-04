"""
URL configuration for RestAPI project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from index.views import indexView, sectionsView, sectionDetailView, rolesView, rolesDetailView, usersView, \
    usersDetailView, studentsView, studentsDetailView, teachersView, teachersDetailView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', indexView),

    path('sections/', sectionsView),
    path('sections/<int:pk>/', sectionDetailView),

    path('roles/',rolesView),
    path('roles/<int:pk>/', rolesDetailView),

    path('users/', usersView),
    path('users/<int:pk>/', usersDetailView),

    path('students/', studentsView),
    path('students/<int:pk>/', studentsDetailView),

    path('teachers/', teachersView),
    path('teachers/<int:pk>/', teachersDetailView),
]
