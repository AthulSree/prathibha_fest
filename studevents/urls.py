from django.urls import path #type:ignore
from . import views
from django.conf import settings # type: ignore
from django.conf.urls.static import static # type: ignore


urlpatterns = [
    path("", views.comp_studevents_index, name="comp_studevents_index"),
    path("save/<int:id>/", views.comp_studevents_save, name="compStudeventsSave"),
    path("comp_stud_events",views.comp_studevents_list, name ="competitive_student_events"),
    path("save_test/<int:id>/", views.save_form_test, name="compStudeventsSaveTest")
]