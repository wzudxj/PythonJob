# Generated by Django 2.0 on 2019-04-25 07:07

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Movie',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Movie_name', models.CharField(db_column='m_name', max_length=255, verbose_name='电影名称')),
            ],
            options={
                'db_table': 'top_movie',
            },
        ),
    ]
