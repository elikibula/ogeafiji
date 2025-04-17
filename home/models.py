
from django.db import models

class VisitorCount(models.Model):
    total_visits = models.PositiveIntegerField(default=0)

    @classmethod
    def increment(cls):
        obj, created = cls.objects.get_or_create(pk=1)
        obj.total_visits += 1
        obj.save()
        return obj.total_visits

    @classmethod
    def get_count(cls):
        obj, created = cls.objects.get_or_create(pk=1)
        return obj.total_visits