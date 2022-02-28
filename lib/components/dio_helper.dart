import 'package:dio/dio.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/constants/end_points.dart';

class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
        connectTimeout: 10000,
      ),
    );
  }

  static Future<Response?> get(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    _dio.options.headers = headers;
      return await _dio.get(endPoint, queryParameters: queryParameters);
  }

  static Future<Response?> postData({
    required String endPoint,
    data,
  }) async {
    try {
      return await _dio.post(endPoint, data: data);
    } catch (error) {
      print('Error when POST ${error.toString()}');
      return null;
    }
  }
  static Future<Response?> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      _dio.options.headers = {
        'Authorization':'Bearer ${CashHelper.getString(key: 'token')}',
      };
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

  static Future<Response?> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
})async{
    try {
      return await _dio.delete(
        endPoint,
        queryParameters: queryParameters
      );
    } on Exception catch (e) {
      print('Error when DELETE METHOD $e');
      return null;
    }
  }

// static post(){
//   _dio.post(path)
// }
}
