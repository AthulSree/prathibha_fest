from django.contrib import admin #type: ignore
from .models import *

# Register your models here.

class StudentsAdmin(admin.ModelAdmin):
    list_display = ('class_list','academic_yr', 'student_name')  # Fields to display in the list view
    search_fields = ('class_list','academic_yr', 'student_name')  # Fields to search by in the admin interface
    list_filter = ('class_list','academic_yr', 'student_name')  # Filter options in the admin sidebar


admin.site.register(Students,StudentsAdmin)