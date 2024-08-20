import 'package:dio/dio.dart';
import 'package:comic_vine_app/config/config.dart';

class BaseInterceptor implements Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.path =
        '${options.path}?api_key=${Env.apiKey}&format=json&sort=date_added%3Adesc';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
