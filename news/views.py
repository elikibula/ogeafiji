from django.views.generic import CreateView, ListView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import get_object_or_404, render, redirect
from .models import News, Category, Comment
from .forms import NewsForm, CommentForm

# Create News View
class NewsCreateView(LoginRequiredMixin, CreateView):
    model = News
    form_class = NewsForm
    template_name = 'news/create_news.html'
    success_url = '/'  # Redirect to homepage after submission

    def form_valid(self, form):
        form.instance.author = self.request.user  # Assign logged-in user as author
        return super().form_valid(form)

# List All News
class NewsListView(ListView):
    model = News
    template_name = 'news/news_list.html'
    context_object_name = 'news_list'
    paginate_by = 10  # Limit 10 news per page

# List News by Category
class CategoryNewsView(ListView):
    model = News
    template_name = 'news/category_news.html'
    context_object_name = 'category_news'
    paginate_by = 10

    def get_queryset(self):
        category = get_object_or_404(Category, slug=self.kwargs['slug'])  
        return News.objects.filter(category=category)

# News Detail View
def news_detail(request, slug):
    news = get_object_or_404(News, slug=slug)
    comments = news.comments.all().order_by('-date_posted')
    all_news = News.objects.all().order_by('-date_posted')  # Fetch all news

    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.news = news
            comment.author = request.user
            comment.save()
            return redirect('news_detail', slug=news.slug)
    else:
        form = CommentForm()

    context = {
        'news': news,
        'comments': comments,
        'form': form,
        'all_news': all_news,  # Pass all news articles to the template
    }
    return render(request, 'news/news_detail.html', context)



