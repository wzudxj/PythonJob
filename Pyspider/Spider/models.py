from django.db import models

# Create your models here.
class Movie(models.Model):
    Movie_name = models.CharField(max_length=255, db_column='m_name', verbose_name='电影名称')
    Movie_star = models.CharField(max_length=255, db_column='m_star', verbose_name='电影评分', null=True)
    Movie_href = models.CharField(max_length=255, db_column='m_href', verbose_name='电影链接', null=True)
    class Meta:
        db_table = 'top_movie'
    def __str__(self):
        return self.Movie_name

class Mobile(models.Model):
    #由于id会自动创建，就不创建了
    Mobile_name = models.CharField(max_length=255, db_column='p_name', verbose_name='手机名称')
    Mobile_price = models.CharField(max_length=255, db_column='p_price', verbose_name='手机价格', null=True)
    Mobile_comment = models.CharField(max_length=255, db_column='p_comment', verbose_name='手机内容', null=True)
    class Meta:
        db_table = 'jd_mobile'
    def __str__(self):
        return self.Mobile_name