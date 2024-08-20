from django.urls import path #type: ignore 
from . import views
from django.conf import settings # type: ignore
from django.conf.urls.static import static # type: ignore


urlpatterns = [
    path('', views.events_master, name='events_master'),
    path('saveEventMaster/<int:id>/', views.save_events, name="save_event_master"),

]

# if settings.DEBUG:
#     urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
