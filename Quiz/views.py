from django.shortcuts import render, get_object_or_404 # type: ignore
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect # type: ignore
from datetime import date, datetime
from .models import ClassList,QuizMaster, AcademicYear
from django.urls import reverse  # type: ignore
from django.utils import timezone # type: ignore
from django.utils.dateparse import parse_date

# Create your views here.


def dashboard(request):
    today_date = date.today().strftime('%d-%m-%Y')
    context = {'today_date':today_date, 'menuactive':'dashboard'}

    # START Academic year creation section
    current_date = datetime.now()
    current_year = current_date.year
    # Format the start and end dates for the academic year
    # Convert the strings into datetime objects
    acStartDate = datetime.strptime(f"01-04-{current_year}", "%d-%m-%Y").date()
    acEndDate = datetime.strptime(f"31-03-{current_year + 1}", "%d-%m-%Y").date()
    next_year_short = str(current_year + 1)[-2:]
    # Create a description for the academic year
    desc = f"{current_year}-{next_year_short}"

    # Get or create the academic year based on the end date
    academic_year, created = AcademicYear.objects.get_or_create(
        endDate__gt=current_date,
        defaults={
            'accYear': current_year,
            'desc': desc,
            'startDate': acStartDate,
            'endDate': acEndDate
        }
    )
    # END Academic year creation section
    return render(request,'Quiz/dashboard.html',context)


def quizMaster(request):
    classlist = ClassList.objects.values('class_level_abbr').distinct()
    context = {'menuactive':'quizMaster', 'classlist':classlist}
    return render(request,'Quiz/quiz_master.html',context)

def quiztonList(request):
    quizton = QuizMaster.objects.all()
    context = {'quizton':quizton}
    return render(request,'Quiz/quizton_list.html',context)

def saveQuizton(request, id):
    acYear = AcademicYear.objects.last()
    if(request.method=='POST'):
        try:
            if(id==0):
                classLevel = request.POST.get('classLevel')
                image = request.FILES.get('inputImage')
                audio = request.FILES.get('inputAudio')
                video = request.FILES.get('inputVideo')

                QuizMaster.objects.create(classLevel=classLevel,image_Q=image,audio_Q=audio,video_Q=video, updated_on = timezone.now(), acc_year=acYear)
                return JsonResponse({'status':200, 'msg':"Added successfully"})
            else:
                quizdata = QuizMaster.objects.get(id=id)
                if not quizdata:
                    return JsonResponse({"error": "Quiz not found"}, status=404)
                else:
                    image = quizdata.image_Q
                    audio = quizdata.audio_Q
                    video = quizdata.video_Q

                if 'classLevel' in request.POST:
                    classLevel = request.POST['classLevel']

                if 'inputImage' in request.FILES:
                    image = request.FILES.get('inputImage')

                if 'inputAudio' in request.FILES:
                    audio = request.FILES['inputAudio']

                if 'inputVideo' in request.FILES:
                    video = request.FILES['inputVideo']

                quizdata.classLevel = classLevel
                quizdata.image_Q=image
                quizdata.audio_Q=audio
                quizdata.video_Q=video
                quizdata.updated_on = timezone.now()
                quizdata.save()

                return JsonResponse({'status':200, 'msg':"Updated successfully"})
        except Exception as e:
            return JsonResponse({'status':300, 'msg':"Some error occurred"})
    else:
        classlist = ClassList.objects.values('class_level_abbr').distinct()
        try:
            quizdata = QuizMaster.objects.get(id=id)
            id = quizdata.id
            classLevel = quizdata.classLevel
        except:
            id =0
            classLevel=''
        context = {'classlist':classlist, 'id':id, 'class_level':classLevel}

        return render(request,'Quiz/quiz_form.html',context)

def deleteQuizton(request, id):
    try:
        quizData=QuizMaster.objects.get(id=id)
        quizData.delete()
        return JsonResponse({'status':200, 'msg':"Deleted successfully"})
    except:
        return JsonResponse({'status':300, 'msg':"Error Occured"})


def classList(request):
    classlists = ClassList.objects.all()
    context = {'menuactive':'classList','classlist':classlists}
    return render(request,'Quiz/class_list.html',context)


def saveClasslist(request):
    data = request.POST
    classno = data.get('classno')
    class_level = data.get('class_level')
    class_level_abbr = data.get('class_level_abbr')

    addeditType = data.get('addedit')
    classid = data.get('classid')
    if(addeditType=='add'):
        ClassList.objects.create(classno=classno, class_level=class_level, class_level_abbr=class_level_abbr)
    else:
        classAvail = ClassList.objects.get(id=classid)
        classAvail.classno = classno
        classAvail.class_level = class_level
        classAvail.class_level_abbr = class_level_abbr
        classAvail.save()
    return HttpResponseRedirect(reverse('classList'))


def printoski(data):
    print(data)
