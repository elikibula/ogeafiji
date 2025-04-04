from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, redirect, get_object_or_404
from .models import Document, DocumentCategory, SubCategory
from .forms import DocumentForm
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
import os
from django.core.files.storage import default_storage

@login_required
def upload_document(request):
    if request.method == 'POST':
        form = DocumentForm(request.POST, request.FILES)
        if form.is_valid():
            files = request.FILES.getlist('file')  # Get list of uploaded files
            for file in files:
                document = Document(
                    title=form.cleaned_data['title'],
                    file=file,
                    description=form.cleaned_data['description'],
                    category=form.cleaned_data['category'],
                    author=request.user,
                )
                document.save()
                document.subcategory.set(form.cleaned_data['subcategory'])
                document.groups.set(form.cleaned_data['groups'])
            return redirect('documents:document_list')
    else:
        form = DocumentForm()

    return render(request, 'documents/upload_document.html', {'form': form})

@login_required
def document_list(request):
    categories = DocumentCategory.objects.all()
    return render(request, 'documents/document_list.html', {'categories': categories})

@login_required
def download_document(request, document_id):
    document = get_object_or_404(Document, id=document_id)
    # Perform any permission checks here, if necessary
    return document.file.serve(request, document.file.name)

@login_required
def delete_document(request, document_id):
    document = get_object_or_404(Document, id=document_id)
    # Perform any permission checks here, if necessary
    document.file.delete()
    document.delete()
    return redirect('documents:document_list')

@login_required
def category_detail(request, category_id):
    category = get_object_or_404(DocumentCategory, id=category_id, groups__in=request.user.groups.all())
    categories = DocumentCategory.objects.all()
    return render(request, 'documents/category_detail.html', {'category': category, 'categories': categories})

@login_required
def subcategory_detail(request, subcategory_id):
    try:
        subcategory = SubCategory.objects.get(id=subcategory_id)
        documents = Document.objects.filter(subcategory=subcategory)
        return render(request, 'documents/subcategory_detail.html', {'subcategory': subcategory, 'documents': documents})
    except SubCategory.DoesNotExist:
        return render(request, 'documents/subcategory_not_found.html')

def get_subcategories(request):
    category_id = request.GET.get('category_id')
    subcategories = SubCategory.objects.filter(category_id=category_id).values('id', 'name')
    return JsonResponse({'subcategories': list(subcategories)})




