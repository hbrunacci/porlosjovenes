# Generated by Django 2.1.7 on 2019-04-10 17:21

from django.db import migrations, models
import django.db.models.deletion
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailimages', '0001_squashed_0021'),
        ('home', '0016_auto_20190410_1548'),
    ]

    operations = [
        migrations.CreateModel(
            name='SponsorClass',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sort_order', models.IntegerField(blank=True, editable=False, null=True)),
                ('nombre_sponsor', models.CharField(help_text='Overwrites the default title', max_length=100, verbose_name='Empresa')),
                ('url_sponsor', models.URLField(blank=True, null=True)),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
        migrations.RemoveField(
            model_name='sponsorapp',
            name='id',
        ),
        migrations.RemoveField(
            model_name='sponsorapp',
            name='imagen_sponsor',
        ),
        migrations.RemoveField(
            model_name='sponsorapp',
            name='nombre_sponsor',
        ),
        migrations.RemoveField(
            model_name='sponsorapp',
            name='sort_order',
        ),
        migrations.RemoveField(
            model_name='sponsorapp',
            name='url_sponsor',
        ),
        migrations.AlterField(
            model_name='sponsorapp',
            name='page',
            field=modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, related_name='carousel_sponsor_app', to='home.App'),
        ),
        migrations.CreateModel(
            name='SponsorCarrera',
            fields=[
                ('sponsorclass_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='home.SponsorClass')),
                ('page', modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, related_name='carousel_sponsor_carrera', to='home.Carrera')),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
            bases=('home.sponsorclass',),
        ),
        migrations.AddField(
            model_name='sponsorclass',
            name='imagen_sponsor',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='wagtailimages.Image'),
        ),
        migrations.AddField(
            model_name='sponsorapp',
            name='sponsorclass_ptr',
            field=models.OneToOneField(auto_created=True, default='', on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='home.SponsorClass'),
            preserve_default=False,
        ),
    ]
