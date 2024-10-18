from django.shortcuts import render,get_object_or_404 #type:ignore
from django.http import JsonResponse #type:ignore
from .forms.comp_studevents_form import CompStudEventForm
from .forms.comp_studevents_form_test import CompStudEventFormTest
from studevents.models import CompStudEvents,formTest
from Quiz.models import AcademicYear
from .models import *
import random

# Create your views here.


def comp_studevents_index(request):
    return render(request,'comp_studevent_index.html')

def comp_studevents_list(request):
    listdata = CompStudEvents.objects.all().order_by('-id')
    # query = "SELECT id, pgm_id, student_id, event_id, academic_year_id  FROM comp_student_events  GROUP BY id, pgm_id, student_id, event_id, academic_year_id"
    # listdata = CompStudEvents.objects.raw(query)
    # query = "SELECT id,standard_id,Event_id,Student_id FROM form_test GROUP BY id,standard_id,Event_id,Student_id"
    # listdata = formTest.objects.all()
    context = {'stud_events':listdata}
    return render(request,'comp_studevent_list.html', context)
    # return render(request,'comp_studevent_list_test.html', context)


def comp_studevents_save(request, id):
    academic_yr = AcademicYear.objects.latest('pk')  # Fetch the latest academic year

    if(id==0):
        pgm_id = generate_unique_chest_number()
        comp_event = None
    else:
        comp_event = get_object_or_404(CompStudEvents, pk=id)
    
    if request.method == "POST":
        if comp_event:
            form = CompStudEventForm(request.POST, instance=comp_event)
        else:
            form = CompStudEventForm(request.POST)

        if form.is_valid():
            event = form.cleaned_data['Event'] 
            pgm_id = form.cleaned_data['pgm_id']
            std = form.cleaned_data['Standard']
            description = form.cleaned_data['Description']
            students = form.cleaned_data['Student']  # This will be a list of selected students
            prize = form.cleaned_data['Prize']

            if comp_event:
                if CompStudEvents.objects.filter(pgm_id=pgm_id).exclude(pk=comp_event.pk).exists():
                    return JsonResponse({'status': 400, 'msg': "Chest No already exists"})
            else:
                if CompStudEvents.objects.filter(pgm_id=pgm_id).exists():
                    return JsonResponse({'status': 400, 'msg': "Chest No already exists"})
            
            for student in students:
                comp_event = CompStudEvents(
                    academic_year=academic_yr,
                    pgm_id=pgm_id,
                    standard=std,
                    student=student,
                    event=event,
                    description=description,
                    prize = prize
                )
                if CompStudEvents.objects.filter(student=student, event=event).exclude(pk=comp_event.pk).exists():
                    return JsonResponse({'status': 400, 'msg': "Already added"})
                comp_event.save()


            return JsonResponse({'status': 200, 'msg': "Operation completed successfully"})
        else:
            # Print form errors for debugging
            print('>>>>>>>>>>>>>>>>>ERROR<<<<<<<<<<<<<<<<<<<<<<<<<<')
            print(form.errors)
            return render(request, 'comp_studevent_form.html', {'form': form, 'id': id})
    else:
        if comp_event:
            print('*****************',comp_event)
            form = CompStudEventForm(instance=comp_event)
            print(form.initial) 
        else:
            form = CompStudEventForm(initial={'pgm_id': pgm_id})

    return render(request, 'comp_studevent_form.html', {'form': form, 'id': id})


def save_form_test(request, id):
    if id == 0:
        ft = None
    else:
        ft = get_object_or_404(formTest, pk=id)
    
    if request.method == 'POST':
        if ft:
            form = CompStudEventFormTest(request.POST, instance=ft)
        else:
            form = CompStudEventFormTest(request.POST)
        
        if form.is_valid():
            std = form.cleaned_data['Standard']
            students = form.cleaned_data['student_list']
            event = form.cleaned_data['Event']

            # Clear the existing related Students if editing
            if ft:
                formTest.objects.filter(id=ft.id).delete()

            # Save each student for the formTest instance
            for stud in students:
                print('<<<<<<<<<<<<<',stud)
                comp = formTest(
                    id=ft.id if ft else None,  # use the existing ID if editing
                    Standard=std,
                    Student=stud,
                    Event=event
                )
                comp.save()

            return JsonResponse({'status': 200, 'msg': "Operation completed successfully"})
        else:
            return render(request, 'comp_studevent_form_test.html', {'form': form, 'id': id})
    else:
        if ft:
            form = CompStudEventFormTest(instance=ft)
            print('////////////////',form.initial)
        else:
            form = CompStudEventFormTest()

    return render(request, 'comp_studevent_form_test.html', {'form': form, 'id': id})


def generate_unique_chest_number():
    chest_number = None
    while True:
        chest_number = random.randint(100, 999)
        if not CompStudEvents.objects.filter(pgm_id=chest_number).exists():
            break
    return chest_number

def get_students_by_class(request):
    if request.method == 'GET':
        class_id = request.GET.get('class_id')
        students = Students.objects.filter(class_list=class_id)  # Adjust this based on your models
        student_list = [{'id': student.id, 'name': student.student_name} for student in students]
        return JsonResponse(student_list, safe=False)