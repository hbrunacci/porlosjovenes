# Generated by Django 2.1.7 on 2019-04-10 13:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0011_app_video_url'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='app',
            name='video_url',
        ),
        migrations.AddField(
            model_name='app',
            name='video_code',
            field=models.CharField(blank=True, max_length=70, null=True, verbose_name='Codigo Video'),
        ),
    ]
