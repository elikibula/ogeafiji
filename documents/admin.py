import os
import zipfile
from django.contrib import admin
from django.shortcuts import get_object_or_404, redirect
from django.http import HttpResponse
from documents.models import Document, DocumentCategory, SubCategory 



class DocumentAdmin(admin.ModelAdmin):
    list_display = ['title', 'category', 'get_subcategories', 'get_category_groups', 'get_subcategory_groups', 'author']
    actions = ['download_selected', 'delete_selected']

    def get_subcategories(self, obj):
        return ", ".join([str(subcategory) for subcategory in obj.subcategory.all()])
    get_subcategories.short_description = 'Subcategories'

    def get_category_groups(self, obj):
        return ", ".join([str(group) for group in obj.category.groups.all()])
    get_category_groups.short_description = 'Category Groups'

    def get_subcategory_groups(self, obj):
        return ", ".join([str(group) for subcategory in obj.subcategory.all() for group in subcategory.groups.all()])
    get_subcategory_groups.short_description = 'Subcategory Groups'

    def download_selected(self, request, queryset):
        if request.method == 'POST':
            selected_documents = request.POST.getlist('selected_documents')
            if selected_documents:
                zip_filename = '/tmp/selected_documents.zip'

                # Create the directory if it doesn't exist
                os.makedirs(os.path.dirname(zip_filename), exist_ok=True)

                with zipfile.ZipFile(zip_filename, 'w') as zip_file:
                    for document_id in selected_documents:
                        document = get_object_or_404(Document, id=document_id)
                        document_path = document.file.path
                        document_name = os.path.basename(document_path)
                        zip_file.write(document_path, arcname=document_name)

                # Serve the ZIP file for download
                with open(zip_filename, 'rb') as file:
                    response = HttpResponse(file.read(), content_type='application/zip')
                    response['Content-Disposition'] = 'attachment; filename=selected_documents.zip'
                    return response

        # If no documents were selected or an error occurred, redirect to the document list page
        return redirect('documents:document_list')

    def delete_selected(self, request, queryset):
        # Delete the selected documents from the database and remove associated files
        for document in queryset:
            document.file.delete()  # Delete the associated file
            document.delete()  # Delete the document object

    download_selected.short_description = "Download selected documents"
    delete_selected.short_description = "Delete selected documents"

class SubcategoryInline(admin.TabularInline):
    model = SubCategory

class DocumentCategoryAdmin(admin.ModelAdmin):
    inlines = [SubcategoryInline]
    list_display = ['name']


admin.site.register(Document, DocumentAdmin)
admin.site.register(DocumentCategory, DocumentCategoryAdmin)

class SubCategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'category']
    list_filter = ['parent_category']
    search_fields = ['name']
    actions = ['add_to_category']
    filter_horizontal = ('categories', 'groups')

    def add_to_category(self, request, queryset):
        selected_subcategories = queryset.all()
        category_ids = [subcategory.parent_category.id for subcategory in selected_subcategories]
        return HttpResponseRedirect('/admin/documents/documentcategory/add/?ids={}'.format(','.join(map(str, category_ids))))

    add_to_category.short_description = "Add selected subcategories to category"


admin.site.register(SubCategory)




