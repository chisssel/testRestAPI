from django.db import models


class Roles(models.Model):
    role_name = models.CharField(unique=True, max_length=60, blank=True, null=True)

    def __str__(self):
        return self.role_name


class Sections(models.Model):
    section_name = models.CharField(max_length=60, blank=True, null=True)

    def __str__(self):
        return self.section_name


class Users(models.Model):
    username = models.CharField(unique=True, max_length=50, blank=True, null=True)
    email = models.EmailField(unique=True, max_length=100)
    password = models.CharField(max_length=40)
    first_name = models.CharField(max_length=40, blank=True, null=True)
    last_name = models.CharField(max_length=40, blank=True, null=True)
    patronymic = models.CharField(max_length=40, blank=True, null=True)
    phone_number = models.CharField(unique=True, max_length=20)
    role = models.ForeignKey(Roles, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name} | {self.role}"


class Students(models.Model):
    user = models.ForeignKey('Users', on_delete=models.CASCADE, blank=True, null=True)
    section = models.ForeignKey(Sections, on_delete=models.CASCADE, blank=True, null=True)
    student_start_date = models.DateField(blank=False, null=False)
    student_end_date = models.DateField(blank=True, null=True)

    def __str__(self):
        return f"{self.user} | {self.section}"


class Teachers(models.Model):
    user = models.ForeignKey('Users', on_delete=models.CASCADE, blank=True, null=True)
    section = models.ForeignKey(Sections, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return f"{self.user} | {self.section}"
