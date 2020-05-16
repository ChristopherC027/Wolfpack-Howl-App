from django.db import models
from django.contrib.auth.models import User


class Job(models.Model):
    JOB_TYPE = [
        ("Full-Time", "Full-Time"),
        ("Part-Time", "Part-Time"),
        ("Internship", "Internship"),
        ("Career Fair", "Career Fair"),
        ("Networking", "Networking"),
        ("Professional Development", "Professional Development"),
    ]

    company = models.CharField(max_length=50)
    title = models.CharField(max_length=50)
    posted_at = models.DateField()
    expires_at = models.DateField()
    website = models.URLField(max_length=200)
    tag = models.CharField(max_length=50, choices=JOB_TYPE)

    def __str__(self):
        return self.title
