from django.urls import path
from .views import ItemAPIView

app_name = 'saba'

urlpatterns = [
    path('', ItemAPIView.as_view(), name='item-list'),
]