from django.urls import path #type: ignore 
from . import views
from django.conf import settings # type: ignore
from django.conf.urls.static import static # type: ignore


urlpatterns = [
    path('', views.students_index, name='students_index'),
    path('list', views.students_list, name='students_list'),
    path('saveStudent/<int:id>/', views.save_student, name="save_student"),

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
