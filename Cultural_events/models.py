from django.db import models #type:ignore
import datetime
from Quiz.models import AcademicYear, ClassList
# Create your models here.
class Events_master(models.Model):
    event = models.CharField(max_length=100)
    competition_item = models.CharField(max_length=1,default='N')
    group_item = models.CharField(max_length=1,default='N')
    updated_on = models.DateTimeField()

    class Meta:
        db_table = 'events_master'

    def __str__(self):
        return self.event

class CulturalEvents(models.Model):
    def upload_path(instance, filename):
        current_year = datetime.datetime.now().year
        return f'{current_year}/CulturalEvnts/{filename}'
    AccYear = models.ForeignKey(AcademicYear, on_delete=models.CASCADE)
    eventId = models.ForeignKey(Events_master, on_delete=models.CASCADE)
    classId = models.ForeignKey(ClassList, on_delete = models.CASCADE)
    EventName = models.CharField(max_length=200)
    EventDesc = models.TextField()
    EventFile = models.FileField(upload_to=upload_path)
    updatedOn = models.DateTimeField(auto_now_add=True)
    FileName = models.CharField(max_length=200, null=True)
    EventOrder = models.IntegerField(null=True)

    class Meta:
        db_table = 'cultural_events'

    def __str__(self):
        return self.EventName


