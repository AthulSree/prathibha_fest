from django.urls import path #type: ignore 
from . import views
from django.conf import settings # type: ignore
from django.conf.urls.static import static # type: ignore


urlpatterns = [
    path('', views.events_master, name='events_master'),
    path('saveEventMaster/<int:id>/', views.save_events, name="save_event_master"),
    path('index', views.cultural_index, name='cultural_events_index'),
    path('list', views.cultral_list, name='cultural_events_list'),
    path('save_cultural_event/<int:id>/', views.save_cultural_event, name='save_cultural_event'),
    path('delete_cultural_event/<int:id>/', views.delete_cultural_event, name='delete_cultural_event'),

]

# if settings.DEBUG:
#     urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
