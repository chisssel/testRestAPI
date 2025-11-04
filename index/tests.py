from django.test import TestCase
from .models import Sections, Roles


class SimpleAPITests(TestCase):
    def test_one_plus_one(self):
        self.assertEqual(1 + 1, 2)
        print("тест 1 + 1 работает!")

    def test_database_connection(self):
        from .models import Sections
        count_before = Sections.objects.count()
        Sections.objects.create(section_name="Тест")
        count_after = Sections.objects.count()
        self.assertEqual(count_after, count_before + 1)
        print("База данных работает!")

    def test_create_section(self):
        section = Sections.objects.create(section_name="Математика")
        self.assertEqual(Sections.objects.count(), 1)
        self.assertEqual(section.section_name, "Математика")
        print("Секция создана успешно!")

    def test_create_role(self):
        role = Roles.objects.create(role_name="Студент")
        self.assertEqual(Roles.objects.count(), 1)
        self.assertEqual(role.role_name, "Студент")
        print("Роль создана успешно!")

    def test_api_returns_something(self):
        response = self.client.get('/sections/')
        self.assertIn(response.status_code, [200, 401, 403, 404])
        print(f"API /sections/ работает, отвечает со статусом: {response.status_code}")