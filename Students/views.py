from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render, redirect

from Quiz.models import AcademicYear
from Students.form.studentForm import StudentForm
from Students.models import Students

def students_index(request):
    context = {'menuactive':'studentsList'}
    return render(request,'Students/students_index.html',context)

def students_list(request):
    students = Students.objects.all().order_by('-id')
    context = {'menuactive':'studentsList','students':students}
    return render(request,'Students/students_list.html',context)


def save_student(request, id):
    # Get the latest row with primary key
    academic_year = AcademicYear.objects.latest('pk')
    if id == 0:
        # Create a new student instance
        student = None
    else:
        # Retrieve the student instance for updating
        student = get_object_or_404(Students, pk=id)
    
    if request.method == 'POST':
        if student:
            form = StudentForm(request.POST, instance=student)
        else:
            form = StudentForm(request.POST)
        
        if form.is_valid():
            student = form.save(commit=False)
            student.academic_yr = academic_year
            student.save()
            return JsonResponse({'status':200, 'msg':"Operation completed successfully"})
        else:
            return render(request, 'Students/studentForm.html', {'form': form, 'id':id})
    else:
        if student:
            print('*****************',student)
            form = StudentForm(instance=student)
            print(form.initial)
        else:
            form = StudentForm()

    return render(request, 'Students/studentForm.html', {'form': form, 'id':id})