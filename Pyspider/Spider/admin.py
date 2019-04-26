from django.contrib import admin

from Spider.models import Movie,Mobile


class MovieAdmin(admin.ModelAdmin):
    list_display = ('id','Movie_name','Movie_star','Movie_href')
    search_fields = ('id','Movie_name')

admin.site.register(Movie,MovieAdmin)
class MobileAdmin(admin.ModelAdmin):
    list_display = ('id','Mobile_name','Mobile_price','Mobile_comment')
    search_fields = ('id','Mobile_name')
admin.site.register(Mobile,MobileAdmin)
