from django.db import models


class Event(models.Model):
    EVENT_TYPE = [
        ("College Visit", "College Visit"),
        ("Volunteer", "Volunteer"),
        ("DBCR", "DBCR"),
        ("Professional Development", "Professional Development"),
        ("Religious", "Religious"),
    ]
    image = models.ImageField(default='default.jpg', upload_to='pics')
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=50)
    event_date = models.DateField()
    website = models.URLField(max_length=200)
    tag = models.CharField(max_length=50, choices=EVENT_TYPE)

    def __str__(self):
        return self.name
