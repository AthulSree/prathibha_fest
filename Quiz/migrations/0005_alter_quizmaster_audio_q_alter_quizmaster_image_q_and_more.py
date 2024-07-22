# Generated by Django 5.0.6 on 2024-07-21 06:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Quiz', '0004_alter_quizmaster_audio_q_alter_quizmaster_image_q_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='quizmaster',
            name='audio_Q',
            field=models.FileField(upload_to='files/2024/quizdocs/audio'),
        ),
        migrations.AlterField(
            model_name='quizmaster',
            name='image_Q',
            field=models.FileField(upload_to='files/2024/quizdocs/image'),
        ),
        migrations.AlterField(
            model_name='quizmaster',
            name='video_Q',
            field=models.FileField(upload_to='files/2024/quizdocs/video'),
        ),
    ]