import 'package:dio/dio.dart' show Response;
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/constants/end_points.dart';
import 'package:most5dm/modules/home/model/model/city/city_model.dart';
import 'package:most5dm/modules/home/model/repository/city/city_repository.dart';

class CityServices extends CityRepository {
  List<CityModel> _Cities = [];

  @override
  Future<List<CityModel>> getAll() async {
    List<CityModel> _allCities = [];
    Response? response = await DioHelper.get(endPoint: GET_ALL_CITY);
    List<dynamic> list = response!.data;
    for(var city in list){
      _allCities.add(CityModel.fromJson(city));
    }
    print('ALL CITY ${_allCities.length}');
    return _allCities;
  }

  @override
  Future<List<CityModel>> getCityByCityId(int cityId) async {
    Response? response = await DioHelper.get(
      endPoint: GET_ALL_CITY_BY_CITY_ID,
      queryParameters: {'CityId': cityId},
    );
    List<dynamic> list = response!.data;
    for(var city in list){
      _Cities.add(CityModel.fromJson(city));
    }
    return _Cities;
  }
}
