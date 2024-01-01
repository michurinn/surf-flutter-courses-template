import 'package:dio/dio.dart';

// Возвращает настроеный клиент Dio
class DioHttpClient {
  final _dio = Dio()
    ..interceptors
    ..interceptors.add(LogInterceptor(
        requestBody: false, responseHeader: false, responseBody: true));
  Dio get dio => _dio;
}
