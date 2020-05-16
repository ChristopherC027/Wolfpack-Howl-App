from django.shortcuts import render

from rest_framework import generics
from .models import Article
from .serializers import ArticleSerializer
from rest_framework.response import Response


class ArticleList(generics.ListCreateAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer

    def list(self, request, *args, **kwargs):
        self.object_list = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(self.object_list, many=True)
        return Response({'results': serializer.data})


class ArticleDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer

    def list(self, request, *args, **kwargs):
        self.object_list = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(self.object_list, many=True)
        return Response({'results': serializer.data})
