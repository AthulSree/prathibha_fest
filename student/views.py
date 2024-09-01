from django.shortcuts import render

# Create your views here.


def studentMaster(request):
    return render(request,'student/student_master.html')