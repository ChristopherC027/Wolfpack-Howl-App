from django.db import models
from django.contrib.auth.models import User


class Info(models.Model):
    firstName = models.CharField(max_length=100)
    lastName = models.CharField(max_length=100)
    classYear = models.CharField(max_length=100)
    emailAddress = models.CharField(max_length=100)
    phoneNumber = models.CharField(max_length=100)

    streetAddress = models.CharField(max_length=100, blank=True, default='')
    city = models.CharField(max_length=100, blank=True, default='')
    state = models.CharField(max_length=100, blank=True, default='')
    zipCode = models.CharField(max_length=100, blank=True, default='')

    employer = models.CharField(max_length=100, blank=True, default='')
    jobTitle = models.CharField(max_length=100, blank=True, default='')

    instName = models.CharField(max_length=100, blank=True, default='')
    degree = models.CharField(max_length=100, blank=True, default='')
    gradDate = models.CharField(max_length=100, blank=True, default='')

    eventNote = models.CharField(max_length=100, blank=True, default='')

    def __str__(self):
        return self.firstName
