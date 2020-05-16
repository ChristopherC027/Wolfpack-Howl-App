from rest_framework import serializers
from .models import Info


class InfoSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('firstName', 'lastName', 'classYear', 'emailAddress', 'phoneNumber',
                  'streetAddress', 'city', 'state', 'zipCode', 'employer', 'jobTitle', 'instName',
                  'degree', 'gradDate', 'eventNote')
        model = Info
