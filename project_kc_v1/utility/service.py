#! @renderer_classes(...)
#! @parser_classes(...)
#! @authentication_classes(...)
#! @throttle_classes(...)
#! @permission_classes(...)
from rest_framework.decorators import api_view,throttle_classes,schema
from rest_framework.response import Response
from rest_framework.throttling import UserRateThrottle
from rest_framework.schemas import AutoSchema

class OncePerDayUserThrottle(UserRateThrottle):
    rate = '1/day'

@api_view()
def hello_world(request):
    return Response({"message": "Hello, world!"})

@api_view(['GET', 'POST'])
def hello_world(request):
    if request.method == 'POST':
        return Response({"message": "Got some data!", "data": request.data})
    return Response({"message": "Hello, world!"})


@api_view(['GET'])
@throttle_classes([OncePerDayUserThrottle])
def view(request):
    return Response({"message": "Hello for today! See you tomorrow!"})


class CustomAutoSchema(AutoSchema):
    def get_link(self, path, method, base_url):
        # override view introspection here...
        pass

@api_view(['GET'])
@schema(CustomAutoSchema())
def view(request):
    return Response({"message": "Hello for today! See you tomorrow!"})

@api_view(['GET'])
@schema(None)
def view(request):
    return Response({"message": "Will not appear in schema!"})