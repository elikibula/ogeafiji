from . import views
from django.urls import path
from .views import NewsCreateView, NewsListView, CategoryNewsView

urlpatterns = [
    path('post/', NewsCreateView.as_view(), name='create_news'),
    path('all/', NewsListView.as_view(), name='news_list'),
    path('category/<slug:slug>/', CategoryNewsView.as_view(), name='category_news'),
    path('<slug:slug>/', views.news_detail, name='news_detail'),
]
