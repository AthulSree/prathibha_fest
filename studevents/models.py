from django.db import models #type:ignore
from Students.models import Students
from Cultural_events.models import Events_master
from Quiz.models import AcademicYear,ClassList

# Create your models here.

class CompStudEvents(models.Model):
    academic_year = models.ForeignKey(AcademicYear, on_delete=models.CASCADE)
    pgm_id = models.IntegerField(null=False)
    standard = models.ForeignKey(ClassList, on_delete=models.CASCADE, null=True)
    student = models.ForeignKey(Students, on_delete=models.CASCADE, null=True)
    event = models.ForeignKey(Events_master, on_delete=models.CASCADE)
    description = models.CharField(max_length=100,null=True)
    prize = models.CharField(max_length=5, null=True)

    class Meta:
        db_table = "comp_student_events"

    def __str__(self):
        return f"{self.student}"



class formTest(models.Model):
    Standard = models.ForeignKey(ClassList,on_delete=models.CASCADE)
    Student = models.ForeignKey(Students,on_delete=models.CASCADE, null=True)
    Event = models.ForeignKey(Events_master, on_delete=models.CASCADE,null=True)


    class Meta:
        db_table = "form_test"

    def __str__(self):
        return f"{self.Standard}"