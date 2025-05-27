from rest_framework.views import APIView
from rest_framework.response import Response

from .models import Item
from .serializers import ItemSerializer


class ItemAPIView(APIView):

    http_method_names = ('get',)

    def get(self, request, *args, **kwargs):

        books = Item.objects.all()
        serializer = ItemSerializer(books, many=True)
        return Response(serializer.data)
        