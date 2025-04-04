# shop/admin.py
from django.db import models
from django.contrib import admin
from .models import Category, Product


class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug', 'description')
    prepopulated_fields = {'slug': ('name',)}
    
    # Customize the form field size in the admin panel
    formfield_overrides = {
        models.TextField: {'widget': admin.widgets.AdminTextareaWidget(attrs={'rows': 3, 'cols': 60})},
    }

admin.site.register(Category, CategoryAdmin)


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'category', 'price', 'stock', 'stock_threshold', 'get_stock_status')
    list_editable = ('price', 'stock', 'stock_threshold')
    list_filter = ('available', 'category', 'stock')
    
    def get_stock_status(self, obj):
        status = obj.stock_status()
        if status == "out-of-stock":
            return "❌ Out of Stock"
        elif status == "low-stock":
            return "⚠️ Low Stock"
        return "✅ In Stock"
    get_stock_status.short_description = 'Stock Status'
    get_stock_status.admin_order_field = 'stock'