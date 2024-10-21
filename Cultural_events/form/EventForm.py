from django import forms
from ..models import *
class EventForm(forms.ModelForm):
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
        required=False,
        widget=forms.Textarea(attrs={
            'class': 'form-control',
            'rows': 3,
            'placeholder': 'Enter event description',
        })
    )
    
    FileName = forms.CharField(
        required=False,
        max_length=200,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Enter file name',
        })
    )

    EventFile = forms.FileField(
        required=False,
        widget=forms.ClearableFileInput(attrs={
            'class': 'form-control-file',
        })
    )

    class Meta:
        model = CulturalEvents
        fields = ['classId', 'eventId', 'EventName','EventDesc','FileName', 'EventFile']