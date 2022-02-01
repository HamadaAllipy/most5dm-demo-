import 'package:dio/dio.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/end_points.dart';

class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> get(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    _dio.options.headers = headers;
    try {
      return await _dio.get(endPoint, queryParameters: queryParameters);
    } catch (error) {
      print('Error when GET ${error.toString()}');
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
      print('Error when POST ${error.toString()}');
      return null;
    }
  }

  static Future<Response?> patch(
      {required String endPoint,
      required Map<String, dynamic> data,
      Map<String, dynamic>? headers}) async{
    try {
      _dio.options.headers = headers;
      return await _dio.patch(endPoint, data: data);
    } on Exception catch (error) {
      print('Error when PATCH ${error.toString()}');
    }
  }

// static post(){
//   _dio.post(path)
// }
}
