from django.db import models

from Quiz.models import AcademicYear, ClassList

# Create your models here.
class Students(models.Model):
    class_list = models.ForeignKey(ClassList, on_delete = models.CASCADE)
    academic_yr = models.ForeignKey(AcademicYear, on_delete= models.CASCADE)
    student_name = models.CharField(max_length=30)

    class Meta:
        db_table ='students'

    def __str__(self):
        return self.student_name