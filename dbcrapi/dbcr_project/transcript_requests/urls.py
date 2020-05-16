from django.urls import path

from .views import RequestList, RequestDetail

urlpatterns = [
    path('<int:pk>/', RequestDetail.as_view()),
    path('', RequestList.as_view()),
]
