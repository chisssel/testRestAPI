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
from rest_framework_simplejwt.views import TokenRefreshView

from index.views import *

urlpatterns = [
    path('auth/login/', login_view, name='login'),
    path('auth/register/', register_view, name='register'),
    path('auth/logout/', logout_view, name='logout'),
    path('auth/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('auth/me/', current_user_view, name='current_user'),

    path('admin/', admin.site.urls),
    path('', indexView),

    path('sections/', sectionsView, name='sections-list'),
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
