from django.contrib import admin #type: ignore
from .models import *


# Register your models here.

class Events_masterAdmin(admin.ModelAdmin):
    list_display = ('event','competition_item','group_item','updated_on')
    search_fields = ('event','competition_item','group_item','updated_on')
    list_filter = ('event','competition_item','group_item','updated_on')

admin.site.register(Events_master,Events_masterAdmin)