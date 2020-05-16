from rest_framework import serializers
from .models import Article


class ArticleSerializer(serializers.ModelSerializer):
    post_date = serializers.DateField(format="%m-%d-%Y")

    class Meta:
        fields = ('name', 'description', 'post_date', 'tag', 'website')
        model = Article
