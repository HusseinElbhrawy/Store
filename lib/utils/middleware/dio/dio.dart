import 'package:dio/dio.dart';

class DioHelperPayment {
  static late Dio _dioHelper;

  static const _kBaseUrl = 'https://accept.paymob.com/api/';
  static initDio() async {
    _dioHelper = Dio(
      BaseOptions(
        baseUrl: _kBaseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    return await _dioHelper.get(
      path,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    _dioHelper.options.headers = {
      'Content-Type': 'application/json',
    };
    return await _dioHelper.post(
      path,
      data: data,
      queryParameters: query,
    );
  }

  static Future putData({required path, required query, headers}) async {
    return await _dioHelper.put(
      path,
      queryParameters: query,
      options: Options(
        headers: headers,
      ),
    );
  }
}
