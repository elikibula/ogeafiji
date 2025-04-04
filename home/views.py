# home/views.py
from django.shortcuts import render
from news.models import News  # Import the News model

def home(request):
    # Fetch featured news and pass it to the template
    featured_news = News.objects.filter(is_featured=True).order_by('-date_posted')[:6]
    context = {
        'featured_news': featured_news  # This is the key variable used in your template
    }
    return render(request, 'home/index.html', context)  # Pass the context

# Keep your other views unchanged
def tubesara_view(request):
    return render(request, 'home/tubesara.html')

def tutu_view(request):
    return render(request, 'home/tu-tu.html')

def mata_view(request):
    return render(request, 'home/mata.html')

def ogea_view(request):
    return render(request, 'home/ko_ogea.html')