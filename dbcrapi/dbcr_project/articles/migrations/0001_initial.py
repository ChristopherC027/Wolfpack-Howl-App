# Generated by Django 2.2 on 2020-02-15 02:03

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('description', models.CharField(max_length=50)),
                ('post_date', models.DateField()),
                ('website', models.URLField()),
                ('tag', models.CharField(choices=[('Academic', 'Academic'), ('Financial Aid', 'Financial Aid'), ('DBCR', 'DBCR'), ('Alumni Spotlight', 'Alumni Spotlight'), ('Newsletter', 'Newsletter'), ('General', 'General')], max_length=50)),
            ],
        ),
    ]
