# context_processors.py (in your app)
from .models import VisitorCount

def visitor_count(request):
    return {
        'total_visits': VisitorCount.get_count()
    }