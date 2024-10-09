# Generated by Django 5.0.6 on 2024-09-29 09:58

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Cultural_events', '0001_initial'),
        ('Quiz', '0009_academicyear_enddate_academicyear_startdate'),
        ('Students', '0001_initial'),
        ('studevents', '0002_rename_studeevents_studevents'),
    ]

    operations = [
        migrations.CreateModel(
            name='CompStudEvents',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pgm_id', models.IntegerField()),
                ('description', models.CharField(max_length=100, null=True)),
                ('academic_year', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Quiz.academicyear')),
                ('event', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Cultural_events.events_master')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Students.students')),
            ],
            options={
                'db_table': 'comp_student_events',
            },
        ),
        migrations.DeleteModel(
            name='StudEvents',
        ),
    ]
