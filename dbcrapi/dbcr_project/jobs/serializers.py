from rest_framework import serializers, mixins
from rest_framework.response import Response
from .models import Job


class JobSerializer(serializers.ModelSerializer):
    posted_at = serializers.DateField(format="%m-%d-%Y")
    expires_at = serializers.DateField(format="%m-%d-%Y")

    class Meta:

        fields = ('company', 'title', 'posted_at', 'expires_at', 'website', 'tag')
        model = Job
