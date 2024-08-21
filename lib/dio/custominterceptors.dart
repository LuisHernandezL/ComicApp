import 'package:dio/dio.dart';

class CustomerInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.path =
        '${options.path}?api_key=583356f0c5a931197681532b0fafe0599b7dca35&format=json&sort=date_added%3Adesc';
    super.onRequest(options, handler);
    return;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    return;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = '';

    if (err.response?.statusCode == 401) {
      errorMessage = 'Unauthorized';
    } else if (err.response?.statusCode == 404) {
      errorMessage = 'Not Found';
    } else if (err.response?.statusCode == 500) {
      errorMessage = 'Internal Server Error';
    } else {
      errorMessage = 'An error occurred';
    }

    if (err.type == DioExceptionType.connectionTimeout) {
      errorMessage = 'Connection Timeout';
    } else if (err.type == DioExceptionType.receiveTimeout) {
      errorMessage = 'Receive Timeout';
    } else if (err.type == DioExceptionType.sendTimeout) {
      errorMessage = 'Send Timeout';
    }

    throw DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        message: errorMessage);
  }
}
