# Generated by Django 2.1.7 on 2019-04-10 17:40

from django.db import migrations, models
import django.db.models.deletion
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0017_auto_20190410_1721'),
    ]

    operations = [
        migrations.CreateModel(
            name='Video_Old',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sort_order', models.IntegerField(blank=True, editable=False, null=True)),
                ('video_code', models.CharField(blank=True, max_length=70, null=True, verbose_name='Codigo Video')),
            ],
            options={
                'abstract': False,
                'ordering': ['sort_order'],
            },
        ),
        migrations.RemoveField(
            model_name='carrera',
            name='video_code',
        ),
        migrations.AddField(
            model_name='video_old',
            name='page',
            field=modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, related_name='carousel_videos_anteriores', to='home.Carrera'),
        ),
    ]
