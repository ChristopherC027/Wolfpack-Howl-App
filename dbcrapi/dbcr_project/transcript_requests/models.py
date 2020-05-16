from django.db import models
from django.contrib.auth.models import User


class Request(models.Model):
    fullName = models.CharField(max_length=100)
    classYear = models.CharField(max_length=100)
    emailAddress = models.CharField(max_length=100)
    needDate = models.CharField(max_length=100)

    vInstCompName = models.CharField(max_length=100, blank=True, default='')
    instCompEmail = models.CharField(max_length=100, blank=True, default='')

    pInstCompName = models.CharField(max_length=100, blank=True, default='')
    address = models.CharField(max_length=100, blank=True, default='')
    city = models.CharField(max_length=100, blank=True, default='')
    state = models.CharField(max_length=100, blank=True, default='')
    zipCode = models.CharField(max_length=100, blank=True, default='')

    def __str__(self):
        return self.fullName
