# Generated by Django 2.1.7 on 2019-04-11 06:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0041_group_collection_permissions_verbose_name_plural'),
        ('wagtailredirects', '0006_redirect_increase_max_length'),
        ('wagtailforms', '0003_capitalizeverbose'),
        ('home', '0041_auto_20190411_0600'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='slider',
            name='page_ptr',
        ),
        migrations.DeleteModel(
            name='Slider',
        ),
    ]
