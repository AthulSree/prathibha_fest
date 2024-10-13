# Generated by Django 5.1 on 2024-10-13 15:02

import Cultural_events.models
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Cultural_events', '0001_initial'),
        ('Quiz', '0009_academicyear_enddate_academicyear_startdate'),
    ]

    operations = [
        migrations.CreateModel(
            name='CulturalEvents',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('EventName', models.CharField(max_length=200)),
                ('EventDesc', models.TextField()),
                ('EventFile', models.FileField(upload_to=Cultural_events.models.CulturalEvents.upload_path)),
                ('updatedOn', models.DateTimeField(auto_now_add=True)),
                ('AccYear', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Quiz.academicyear')),
                ('classId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Quiz.classlist')),
                ('eventId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Cultural_events.events_master')),
            ],
            options={
                'db_table': 'cultural_events',
            },
        ),
    ]
