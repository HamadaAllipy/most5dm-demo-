import 'package:dio/dio.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/constants/end_points.dart';
import 'package:most5dm/modules/add_ads/Model/repositories/images_repository.dart';

class ImagesService extends ImagesRepository{

  @override
  Future<String> uploadImage(FormData formData) async{

    try {
      Response? response = await DioHelper.postData(endPoint: UPLOAD_IMAGE, data: formData);
      return response!.data;
    } on Exception catch (e) {
      print('Error::::=> $e');
      return '';
    }
  }

  @override
  Future<String> deleteByUri(String stringUri) async{
    try {
      Response? response = await DioHelper.delete(
        endPoint: DELETE_BY_URI,
        queryParameters: {'Uri': stringUri},
      );
      return response!.data;
    } on Exception catch (e) {
      print('Error::: =>> $e');
    }
    return '';
  }
}