from django import forms

from Quiz.models import ClassList
from ..models import Students

class StudentForm(forms.ModelForm):
    class_list = forms.ModelChoiceField(
                queryset=ClassList.objects.all(),
                widget=forms.Select(attrs={
                    'class': 'form-control select2',
                }) 
            )
    student_name = forms.CharField(
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Enter your name',
        })
    )
        
    
    class Meta:
        model=Students
        fields=['class_list', 'student_name']

    # def clean(self):
    #     cleaned_data = super().clean()
    #     name = cleaned_data.get('student_name')
    #     student_class = cleaned_data.get('class_list')

    #     if Students.objects.filter(student_name=name, class_list=student_class).exists():
    #         raise forms.ValidationError(f"The student name '{name}' and class combination already exists.")

    #     return cleaned_data
        


