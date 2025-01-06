import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] =
        'Bearer  eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTdhMWJmNzBlZjNkNTRjOWVkMGFhMWQzMDgyMDgyOSIsIm5iZiI6MTczMDAyMDcyNS4xMjksInN1YiI6IjY3MWUwNTc1MjY4NWNiNjU2M2MxMTNlMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ndIC6EetHYNl_L_lxNigTtqMEANv21L7CARdWyXqZxE';
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    handler.next(options);
  }
}
