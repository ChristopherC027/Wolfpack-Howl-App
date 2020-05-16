from django.urls import path
from .views import InfoList, InfoDetail

urlpatterns = [
    path('<int:pk>/', InfoDetail.as_view()),
    path('', InfoList.as_view()),
]
