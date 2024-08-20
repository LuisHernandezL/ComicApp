import 'package:comic_vine_app/network/base_interceptor.dart';
import 'package:comic_vine_app/config/constants/env.dart';
import 'package:dio/dio.dart';

class ComicVineApiClient {
  Dio dio;

  ComicVineApiClient._(String? url) : dio = _interceptors(url);

  static Dio _interceptors(String? url) {
    final dio = Dio();

    final baseOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: 1000),
      receiveTimeout: const Duration(milliseconds: 1000),
      baseUrl: url ?? Env.baseUrl,
    );

    dio.interceptors.add(BaseInterceptor());
    dio.options = baseOptions;
    return dio;
  }

  static ComicVineApiClient? _instance;

  static ComicVineApiClient getInstance(String? url) {
    _instance ??= ComicVineApiClient._(url);
    return _instance!;
  }
}
