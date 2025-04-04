from django import forms
from .models import Document, SubCategory, DocumentCategory

class DocumentForm(forms.ModelForm):
    file = forms.FileField(widget=forms.ClearableFileInput(), required=True)  # Remove `multiple=True`

    class Meta:
        model = Document
        fields = ['title', 'file', 'description', 'category', 'subcategory', 'groups']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Limit categories and subcategories based on user groups
        if 'category' in self.data:
            try:
                category_id = int(self.data.get('category'))
                self.fields['subcategory'].queryset = SubCategory.objects.filter(category_id=category_id)
            except (ValueError, TypeError):
                pass
        elif self.instance.pk:
            self.fields['subcategory'].queryset = self.instance.category.subcategory_set
