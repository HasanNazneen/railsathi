from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from .models import Item  # or whatever your model is
from .serializers import ItemSerializer

class ItemViewSet(viewsets.ModelViewSet):
    queryset = Item.objects.all()
    serializer_class = ItemSerializer
