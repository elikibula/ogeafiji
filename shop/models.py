from django.db import models
from django.contrib.auth import get_user_model
from django.urls import reverse
from django.conf import settings

User = get_user_model()

class Category(models.Model):
    name = models.CharField(max_length=100, unique=True)
    slug = models.SlugField(unique=True)
    description = models.TextField(blank=True)
    
    class Meta:
        verbose_name_plural = "Categories"
        ordering = ['name']
    
    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('shop:product_list_by_category', args=[self.slug])

class Product(models.Model):
    seller = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='products'
    )
    category = models.ForeignKey(
        Category,
        related_name='products',
        on_delete=models.CASCADE
    )
    name = models.CharField(max_length=200)
    slug = models.SlugField(unique=True)
    description = models.TextField()
    price = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        help_text="Price in your local currency"
    )
    contact_phone = models.CharField(
        max_length=20,
        help_text="Phone number for buyers to contact"
    )
    location = models.CharField(
        max_length=100,
        blank=True,
        null=True,
        help_text="Where the product is located"
    )
    available = models.BooleanField(default=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    image = models.ImageField(
        upload_to='products/%Y/%m/%d',
        blank=True,
        null=True
    )
    stock = models.PositiveIntegerField(
        default=1,
        help_text="Current inventory count"
    )
    stock_threshold = models.PositiveIntegerField(
        default=2,
        help_text="Show 'Low Stock' warning when below this number"
    )
    
    class Meta:
        ordering = ['-created']
        indexes = [
            models.Index(fields=['-created']),
            models.Index(fields=['slug']),
        ]
    
    def stock_status(self):
        if self.stock == 0:
            return "out-of-stock"
        elif self.stock < self.stock_threshold:
            return "low-stock"
        return "in-stock"
    
    def __str__(self):
        return f"{self.name} (${self.price})"
    
    def get_seller_name(self):
        return f"{self.seller.first_name} {self.seller.last_name}" if self.seller.first_name else self.seller.username
    
    def get_absolute_url(self):
        return reverse('shop:product_detail', args=[self.id, self.slug])
    
    def save(self, *args, **kwargs):
        # Auto-set available status based on stock
        if self.stock == 0:
            self.available = False
        elif not self.available and self.stock > 0:
            self.available = True
        super().save(*args, **kwargs)