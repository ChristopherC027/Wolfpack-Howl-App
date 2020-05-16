from django.shortcuts import render

from django.shortcuts import render

from rest_framework import generics
from .models import Request
from .serializers import RequestSerializer
from rest_framework.response import Response


class RequestList(generics.ListCreateAPIView):
    queryset = Request.objects.all()
    serializer_class = RequestSerializer


class RequestDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Request.objects.all()
    serializer_class = RequestSerializer
