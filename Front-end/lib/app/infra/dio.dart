import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  static Dio? _instance;

  static Dio getInstance() {
    _instance ??= _createDioInstance();
    return _instance!;
  }

  static void dispose() {
    _instance == null;
  }

  static Dio _createDioInstance() {
    var dio = Dio();

    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        //debug request
        if (kDebugMode) print(options.baseUrl);
        if (kDebugMode) print(options.path);
        if (kDebugMode) print(options.method);
        if (kDebugMode) print(options.data.toString());
        if (kDebugMode) print(options.headers.toString());
        if (kDebugMode) print(options.queryParameters.toString());

        return handler.next(options);
      },
      onError: (DioException exception, handler) async {
        if (kDebugMode) {
          print('-------------------------');
          print(exception.toString());
          print(exception.error);
          print(exception.message);
          print(exception.response);
          print(exception.response?.statusCode);
          print(exception.response?.data);
          print('-------------------------');
        }
        if (exception.response?.statusCode == 403) {
          try {
            return handler.resolve(await dio.fetch(exception.requestOptions));
          } catch (error) {
            if (kDebugMode) print(error);
          }
        }
        return handler.next(exception);
      },
      onResponse: (response, handler) async {
        if (kDebugMode) print(response.data);
        if (kDebugMode) print(response.statusMessage);
        if (kDebugMode) print(response.statusCode);
        return handler.next(response);
      },
    ));
    return dio;
  }
}
