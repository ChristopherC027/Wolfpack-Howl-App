from django.shortcuts import render

from rest_framework import generics
from .models import Event
from .serializers import EventSerializer
from rest_framework.response import Response


class EventList(generics.ListCreateAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSerializer

    def list(self, request, *args, **kwargs):
        self.object_list = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(self.object_list, many=True)
        return Response({'results': serializer.data})


class EventDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSerializer

    def list(self, request, *args, **kwargs):
        self.object_list = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(self.object_list, many=True)
        return Response({'results': serializer.data})
