from django.db import models
from django.utils import timezone

# Create your models here.
class AcademicYear(models.Model):
    accYear = models.CharField(max_length=4)
    desc = models.CharField(max_length=7)
    startDate = models.DateField(default=timezone.now)
    endDate = models.DateField(default=timezone.now)
    class Meta:
        db_table = 'academic_year'
    def __str__(self):
        return self.desc

class ClassList(models.Model):
    classno = models.IntegerField(default=0,null=False)
    class_level = models.CharField(max_length=50)
    class_level_abbr = models.CharField(max_length=5)

    class Meta:
        db_table = 'class_list'

    def __str__(self):
        # return f"{self.classno}-{self.class_level}"
        return f"{self.classno}"


class QuizMaster(models.Model):
    # classId = models.ForeignKey(ClassList, models.PROTECT, db_column='class_id')
    classLevel = models.CharField(max_length=5)
    image_Q = models.FileField(upload_to='2024/quizdocs/image')
    audio_Q = models.FileField(upload_to='2024/quizdocs/audio')
    video_Q = models.FileField(upload_to='2024/quizdocs/video')
    updated_on = models.DateTimeField()
    acc_year = models.ForeignKey(AcademicYear, on_delete=models.CASCADE)

    class Meta:
        db_table = 'quiz_master'

    def __str__(self):
        # return f"{self.classId}-{self.id}"
        return f"{self.id}"



