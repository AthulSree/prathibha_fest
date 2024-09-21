from django.contrib import admin
from .models import *
# Register your models here.

class ClassListAdmin(admin.ModelAdmin):
    list_display = ('id','classno', 'class_level', 'class_level_abbr')  # Fields to display in the list view
    search_fields = ('classno', 'class_level', 'class_level_abbr')  # Fields to search by in the admin interface
    list_filter = ('classno', 'class_level', 'class_level_abbr')  # Filter options in the admin sidebar

class QuizMasterAdmin(admin.ModelAdmin):
    list_display = ('classLevel','image_Q','audio_Q','video_Q','updated_on','acc_year')
    search_fields = ('classLevel','image_Q','audio_Q','video_Q','updated_on')
    list_filter = ('classLevel','image_Q','audio_Q','video_Q','updated_on','acc_year')

admin.site.register(AcademicYear),
admin.site.register(ClassList,ClassListAdmin),
admin.site.register(QuizMaster,QuizMasterAdmin),





