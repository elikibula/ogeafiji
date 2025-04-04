from django.db import models
from django.urls import reverse
from django.contrib.auth.models import User, Group
from django.utils import timezone
from django.views.generic import DetailView
from django.conf import settings

class DocumentCategory(models.Model):
    name = models.CharField(max_length=200)
    groups = models.ManyToManyField(Group)
    parent_category = models.ForeignKey('self', on_delete=models.CASCADE, blank=True, null=True, related_name='subcategories')

    def __str__(self):
        return self.name

class SubCategory(models.Model):
    name = models.CharField(max_length=200)
    groups = models.ManyToManyField(Group)
    category = models.ForeignKey(DocumentCategory, on_delete=models.CASCADE, default=1)

    def __str__(self):
        return self.name

class Document(models.Model):
    title = models.CharField(max_length=600)
    file = models.FileField(upload_to='documents/')
    description = models.TextField(blank=True)
    category = models.ForeignKey(DocumentCategory, on_delete=models.CASCADE, null=True)
    subcategory = models.ManyToManyField(SubCategory)
    date_posted = models.DateTimeField(default=timezone.now)
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    groups = models.ManyToManyField(Group, blank=True)

    def __str__(self):
        return self.title

class CategoryDetail(DetailView):
    model = DocumentCategory
    template_name = 'category_detail.html'
    context_object_name = 'category'

