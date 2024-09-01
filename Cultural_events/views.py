from django.shortcuts import render #type: ignore
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect # type: ignore
from django.urls import reverse  # type: ignore
from django.utils import timezone
from .models import Events_master

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
