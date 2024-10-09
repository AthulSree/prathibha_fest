from django import forms #type:ignore
from Students.models import Students
from Cultural_events.models import Events_master
from Quiz.models import ClassList
from ..models import formTest

class CompStudEventFormTest(forms.ModelForm):

    Standard = forms.ModelChoiceField(
        queryset=ClassList.objects.all(),
        label="Class",
        widget=forms.Select(attrs={'class':'form-control select2'})
    )

    event = forms.ModelChoiceField(
        queryset=Events_master.objects.filter(competition_item = 'Y'),
        label="Programme",
        widget=forms.Select(attrs={'class':'form-control select2'})
    )

    student_list = forms.ModelMultipleChoiceField(
        queryset=Students.objects.all(),
        label="Participant",
        widget=forms.SelectMultiple(attrs={'class':'form-control select2'})
    )

    class Meta:
        model=formTest
        fields=['Standard','Event','student_list']
        

    # def clean(self):
    #     cleaned_data = super().clean()
    #     pgmid = cleaned_data.get('pgm_id')
    #     Student = cleaned_data.get('Student')
    #     Event = cleaned_data.get('Event')
    #     Description = cleaned_data.get('Description')

    #     if StudEvents.objects.filter(pgm_id=pgmid, student=Student, event )
