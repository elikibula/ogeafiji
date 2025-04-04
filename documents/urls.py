from django.urls import path, include
from documents.views import upload_document, document_list, download_document, delete_document, category_detail, subcategory_detail, get_subcategories
from documents.category_views import CategoryDetail
from documents import views
from django.conf.urls.static import static
from django.conf import settings


app_name = 'documents'

urlpatterns = [
    path('upload/', upload_document, name='upload_document'),
    path('', document_list, name='document_list'),
    path('subcategory/<int:subcategory_id>/', views.subcategory_detail, name='subcategory_detail'),
    path('category/<int:category_id>/', views.category_detail, name='category_detail'),
    path('<int:document_id>/download/', download_document, name='download_document'),
    path('<int:document_id>/delete/', delete_document, name='delete_document'),
    path('get_subcategories/', views.get_subcategories, name='get_subcategories'),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)









