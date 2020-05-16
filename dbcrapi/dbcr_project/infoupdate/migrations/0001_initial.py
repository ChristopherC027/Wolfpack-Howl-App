# Generated by Django 2.2 on 2020-05-08 04:23

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='info',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firstName', models.CharField(max_length=100)),
                ('lastName', models.CharField(max_length=100)),
                ('classYear', models.CharField(max_length=100)),
                ('emailAddress', models.CharField(max_length=100)),
                ('phoneNumber', models.CharField(max_length=100)),
                ('streetAddress', models.CharField(blank=True, default='', max_length=100)),
                ('city', models.CharField(blank=True, default='', max_length=100)),
                ('state', models.CharField(blank=True, default='', max_length=100)),
                ('zipCode', models.CharField(blank=True, default='', max_length=100)),
                ('employer', models.CharField(blank=True, default='', max_length=100)),
                ('jobTitle', models.CharField(blank=True, default='', max_length=100)),
                ('instName', models.CharField(blank=True, default='', max_length=100)),
                ('degree', models.CharField(blank=True, default='', max_length=100)),
                ('gradDate', models.CharField(blank=True, default='', max_length=100)),
                ('eventNote', models.CharField(blank=True, default='', max_length=100)),
            ],
        ),
    ]
