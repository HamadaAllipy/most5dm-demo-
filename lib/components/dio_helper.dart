import 'package:dio/dio.dart';
import 'package:most5dm/constants/app_string.dart';

class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppString.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    _dio.options.headers = {};
    try {
      return await _dio.get(endPoint, queryParameters: queryParameters);
    } catch (error) {
      print('Error when get ${error.toString()}');
      return null;
    }
  }

  static Future<Response?> postData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await _dio.post(endPoint, data: data);
    } catch (error) {
      return null;
    }
  }

// static post(){
//   _dio.post(path)
// }
}
