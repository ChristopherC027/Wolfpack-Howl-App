from django.db import models


class Article(models.Model):
    ARTICLE_TYPE = [
        ("Academic", "Academic"),
        ("Financial Aid", "Financial Aid"),
        ("DBCR", "DBCR"),
        ("Alumni Spotlight", "Alumni Spotlight"),
        ("Newsletter", "Newsletter"),
        ("General", "General"),
    ]

    name = models.CharField(max_length=50)
    description = models.CharField(max_length=50)
    post_date = models.DateField()
    website = models.URLField(max_length=200)
    tag = models.CharField(max_length=50, choices=ARTICLE_TYPE)

    def __str__(self):
        return self.name
