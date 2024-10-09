from django import forms #type:ignore
from Students.models import Students
from Cultural_events.models import Events_master
from Quiz.models import ClassList
from ..models import CompStudEvents

class CompStudEventForm(forms.ModelForm):
    pgm_id = forms.CharField(
        label='Chest Number',
        widget=forms.TextInput(attrs={'class':'form-control'})
    )
    Standard = forms.ModelChoiceField(
        queryset=ClassList.objects.all(),
        label="Class",
        widget=forms.Select(attrs={'class':'form-control select2'})
    )
    Student = forms.ModelMultipleChoiceField(
        queryset=Students.objects.all(),
        label="Student",
        widget=forms.SelectMultiple(attrs={'class':"form-control select2"})
    )
    Event = forms.ModelChoiceField(
        queryset=Events_master.objects.filter(competition_item = 'Y'),
        label="Event",
        widget=forms.Select(attrs={'class':'form-control select2'})
    )
    Description = forms.CharField(
        label="Description",
        required=False,
        widget=forms.Textarea(attrs={'class':'form-control'})
    )


    class Meta:
        model=CompStudEvents
        fields=['pgm_id','Standard','Student','Event','Description']
        

    # def clean(self):
    #     cleaned_data = super().clean()
    #     pgmid = cleaned_data.get('pgm_id')
    #     Student = cleaned_data.get('Student')
    #     Event = cleaned_data.get('Event')
    #     Description = cleaned_data.get('Description')

    #     if StudEvents.objects.filter(pgm_id=pgmid, student=Student, event )
