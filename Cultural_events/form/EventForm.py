from django import forms
from ..models import AcademicYear, Events_master, ClassList

class EventForm(forms.Form):
    # AccYear = forms.ModelChoiceField(
    #     queryset=AcademicYear.objects.all(),
    #     widget=forms.Select(attrs={
    #         'class': 'form-control select2',
    #     })
    # )
    
    classId = forms.ModelChoiceField(
        queryset=ClassList.objects.all(),
        widget=forms.Select(attrs={
            'class': 'form-control select2',
        })
    )
    eventId = forms.ModelChoiceField(
        queryset=Events_master.objects.filter(competition_item='N'),
        widget=forms.Select(attrs={
            'class': 'form-control select2',
        })
    )
    
    
    EventName = forms.CharField(
        max_length=200,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Enter event name',
        })
    )
    
    EventDesc = forms.CharField(
        widget=forms.Textarea(attrs={
            'class': 'form-control',
            'rows': 3,
            'placeholder': 'Enter event description',
        })
    )
    
    EventFile = forms.FileField(
        widget=forms.ClearableFileInput(attrs={
            'class': 'form-control-file',
        })
    )
