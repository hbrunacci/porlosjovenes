# Generated by Django 2.1.7 on 2019-04-11 04:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0037_auto_20190411_0436'),
    ]

    operations = [
        migrations.AddField(
            model_name='memoria',
            name='memoria_url',
            field=models.URLField(blank=True, null=True),
        ),
    ]
