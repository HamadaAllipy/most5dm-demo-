import 'package:dio/dio.dart';

abstract class ImagesRepository{

  Future<String> uploadImage(FormData formData);
  Future<String> deleteByUri(String stringUri);
}