import 'package:most5dm/modules/home/model/model/city/city_model.dart';

abstract class CityRepository{
  Future<List<CityModel>> getAll();

  Future<List<CityModel>> getCityByCityId(int cityId);
}