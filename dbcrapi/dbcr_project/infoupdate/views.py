from django.shortcuts import render

from rest_framework import generics
from .models import Info
from .serializers import InfoSerializer


class InfoList(generics.ListCreateAPIView):
    queryset = Info.objects.all()
    serializer_class = InfoSerializer


class InfoDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Info.objects.all()
    serializer_class = InfoSerializer
