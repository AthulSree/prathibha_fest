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
    path('events_order_list', views.events_order_list, name='events_order_list'),
    path('print_cultural_events_ordered',views.print_cultural_events_ordered, name='print_cultural_events_ordered'),
    path('show_playlist', views.show_playlist, name='show_playlist'),
    path('update_event_order', views.update_event_order, name="update_event_order")

]

# if settings.DEBUG:
#     urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
