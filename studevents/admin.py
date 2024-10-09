from django.contrib import admin #type: ignore
from .models import *

# Register your models here.

class CompStudEventsAdmin(admin.ModelAdmin):
    list_display = ('pgm_id','standard','student','event','description')
    search_fields = ('pgm_id','standard','student','event','description')
    list_filter = ('pgm_id','standard','student','event','description')


admin.site.register(CompStudEvents,CompStudEventsAdmin)
