from django.contrib import admin
from .models import Job

admin.site.register(Job)


class ObjectAdmin(admin.ModelAdmin):
    ordering = ['-order']
