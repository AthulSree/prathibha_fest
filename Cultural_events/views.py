from django.shortcuts import render #type: ignore
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect # type: ignore
from django.urls import reverse  # type: ignore
from django.utils import timezone #type: ignore
from .models import *
from Cultural_events.form.EventForm import EventForm
from django.shortcuts import get_object_or_404, render #type: ignore
from django.template.loader import render_to_string #type: ignore
from weasyprint import HTML #type: ignore

# Create your views here.


def events_master(request):
    events_list = Events_master.objects.all().order_by('id')
    context = {'menuactive':'eventsMaster', 'events_list': events_list}
    return render(request,'Cultural_events/events_master.html',context)

def save_events(request, id):
    if(request.method == 'POST'):
        if(id==0):
            post = request.POST
            eventname = post.get('event_name')
            comp_item = post.get('comp_item')
            grp_item = post.get('grp_item')

            comp_item = 'Y' if comp_item == 'on' else 'N'
            grp_item = 'Y' if grp_item == 'on' else 'N'

            Events_master.objects.create(event=eventname, competition_item=comp_item, group_item=grp_item, updated_on=timezone.now())
            return HttpResponseRedirect(reverse('events_master'))
        else:
            post = request.POST
            eventname = post.get('event_name')
            comp_item = post.get('comp_item')
            grp_item = post.get('grp_item')

            comp_item = 'Y' if comp_item == 'on' else 'N'
            grp_item = 'Y' if grp_item == 'on' else 'N'

            Events_master.objects.filter(id=id).update(event=eventname, competition_item=comp_item, group_item=grp_item, updated_on=timezone.now())
            return HttpResponseRedirect(reverse('events_master'))

    else:
        try:
            events = Events_master.objects.get(id=id)
            id = events.id
            event = events.event
            group = events.group_item
            comp = events.competition_item
        except:
            id =0
            event = ''
            group = ''
            comp =''
        context = {'id':id, 'event':event, 'group':group, 'comp':comp}

        return render(request,'Cultural_events/events_master_form.html',context)


def cultural_index(request):
    context = {'menuactive':'culturalEvnts', 'events_list': []}
    return render(request,'Cultural_events/events_index.html',context)
def cultral_list(request):
    events = CulturalEvents.objects.all().order_by('id')
    context = {'events': events}
    return render(request, 'Cultural_events/events_list.html', context)
def save_cultural_event(request, id):
    # Get the latest academic year
    academic_year = AcademicYear.objects.latest('pk')

    # Check if we're editing an existing event or creating a new one
    if id == 0:
        events = None
    else:
        events = get_object_or_404(CulturalEvents, pk=id)

    if request.method == 'POST':
        # Initialize the form, either for a new event or an existing one
        if events:
            form = EventForm(request.POST, request.FILES, instance=events)
        else:
            form = EventForm(request.POST, request.FILES)

        # Check if the form is valid
        if form.is_valid():
            if events:
                # Update the existing event instance
                events.AccYear = academic_year
                events.eventId = form.cleaned_data['eventId']
                events.classId = form.cleaned_data['classId']
                events.EventName = form.cleaned_data['EventName']
                events.EventDesc = form.cleaned_data['EventDesc']
                events.FileName = form.cleaned_data['FileName']
                if form.cleaned_data.get('EventFile'):  # Only set if a new file is uploaded
                    events.EventFile = form.cleaned_data['EventFile']
                events.save()
            else:
                # Create a new event instance
                event = CulturalEvents(
                    AccYear=academic_year,
                    eventId=form.cleaned_data['eventId'],
                    classId=form.cleaned_data['classId'],
                    EventName=form.cleaned_data['EventName'],
                    EventDesc=form.cleaned_data['EventDesc'],
                    EventFile=form.cleaned_data['EventFile'],
                    FileName = form.cleaned_data['FileName']

                )
                event.save()

            return JsonResponse({'status': 200, 'msg': "Operation completed successfully"})
        else:
            # If the form is not valid, render the form with errors
            return render(request, 'Cultural_events/cultural_event_form.html', {'form': form, 'id': id})

    else:
        # For GET requests, initialize the form
        if events:
            form = EventForm(instance=events)
        else:
            form = EventForm()

    return render(request, 'Cultural_events/cultural_event_form.html', {'form': form, 'id': id})

def delete_cultural_event(request, id):
    event = get_object_or_404(CulturalEvents, pk=id)
    event.delete()
    return JsonResponse({'status': 200, 'msg': "Event deleted successfully"})

def events_order_list(request):
    events = CulturalEvents.objects.all().order_by('EventOrder')
    context = {'menuactive':'culturalEvnts','events': events}
    return render(request,'Cultural_events/events_order_list.html', context)

def show_playlist(request):
    events = CulturalEvents.objects.all().order_by('EventOrder')
    context = {'menuactive':'culturalEvnts','events': events}
    return render(request,'Cultural_events/play_list.html', context)

def print_cultural_events_ordered(request):

    data = CulturalEvents.objects.all().order_by('EventOrder')
    context = {'data':data}
    # html_string = "<h1>Goes Here!</h1>"
    html_string = render_to_string("Cultural_events/cultural_events_ordered.html", context)
    pdf_file = HTML(string=html_string).write_pdf()
    response = HttpResponse(pdf_file, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="output.pdf"'

    return response


def update_event_order(request):
    try:
        # Get the event object by its ID
        event_id = request.POST.get('eventId')
        event_order = request.POST.get('event_order')
        
        event = get_object_or_404(CulturalEvents, id=event_id)

        # Update the event order
        event.EventOrder = event_order
        event.save()

        return JsonResponse({'status': 200, 'msg': "Operation completed successfully"})    
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=400)