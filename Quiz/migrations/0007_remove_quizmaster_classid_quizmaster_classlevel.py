# Generated by Django 5.0.6 on 2024-07-21 07:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Quiz', '0006_alter_quizmaster_audio_q_alter_quizmaster_image_q_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='quizmaster',
            name='classId',
        ),
        migrations.AddField(
            model_name='quizmaster',
            name='classLevel',
            field=models.CharField(default='', max_length=5),
            preserve_default=False,
        ),
    ]