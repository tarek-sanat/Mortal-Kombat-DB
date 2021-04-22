from django.urls import path
from . import views

urlpatterns = [
    path('', views.home),
    path('characters/', views.characters),
    path("characters/add/", views.addCharacter),
    path('characters/<id>', views.character),
    path('characters/edit/<id>', views.editCharacter),
    path('characters/delete/<id>', views.deleteCharacter),
    path('characters/<id>/addCombo', views.addCombo),
    path('characters/<charID>/editCombo/<comboID>', views.editCombo),
    path('characters/<charID>/deleteCombo/<comboID>', views.deleteCombo),
    path('arenas/delete/<id>', views.deleteArena),
    path('arenas/edit/<id>', views.editArena),
    path('arenas/', views.arenas),
    path('arenas/<id>', views.arena),
    path('arenas/add/', views.addArena)
    
]