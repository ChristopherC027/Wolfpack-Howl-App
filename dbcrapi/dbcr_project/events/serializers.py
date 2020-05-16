from rest_framework import serializers
from .models import Event


class EventSerializer(serializers.ModelSerializer):
    event_date = serializers.DateField(format="%m-%d-%Y")

    class Meta:
        fields = ("image", "name", "description", "event_date", "website", "tag",)
        model = Event
