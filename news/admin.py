from django.contrib import admin
from .models import News, Category

@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('title',)}  # Auto-generate slug in admin
    list_display = ('title', 'slug', 'author', 'category', 'is_featured', 'date_posted')
    list_filter = ('category', 'is_featured')

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}  # Auto-generate slug from name

