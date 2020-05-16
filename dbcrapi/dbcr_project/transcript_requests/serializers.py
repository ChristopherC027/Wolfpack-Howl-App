from rest_framework import serializers
from django.conf import settings
from .models import Request


class RequestSerializer(serializers.ModelSerializer):

    class Meta:
        fields = ('fullName', 'classYear', 'emailAddress', 'needDate', 'vInstCompName',
                  'instCompEmail', 'pInstCompName', 'address', 'city', 'state', 'zipCode',)
        model = Request
