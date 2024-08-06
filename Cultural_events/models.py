from django.db import models #type:ignore

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

