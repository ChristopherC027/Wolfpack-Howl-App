from django.shortcuts import render
from rest_framework.response import Response
from rest_framework import generics, permissions

from .models import Job
from .serializers import JobSerializer


class JobList(generics.ListCreateAPIView):
    queryset = Job.objects.all()
    serializer_class = JobSerializer

    def list(self, request, *args, **kwargs):
        self.object_list = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(self.object_list, many=True)
        return Response({'results': serializer.data})


class JobDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Job.objects.all()
    serializer_class = JobSerializer

    def list(self, request, *args, **kwargs):
        self.object_list = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(self.object_list, many=True)
        return Response({'results': serializer.data})
