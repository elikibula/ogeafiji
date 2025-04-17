from home.models import VisitorCount 


class SessionBasedCounterMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Only count visits for non-admin pages
        if not request.path.startswith('/admin'):
            if not request.session.get('has_visited', False):
                VisitorCount.increment()
                request.session['has_visited'] = True

        response = self.get_response(request)
        return response