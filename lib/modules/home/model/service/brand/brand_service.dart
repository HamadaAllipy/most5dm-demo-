import 'package:dio/dio.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/constants/end_points.dart';
import 'package:most5dm/modules/home/model/model/brand/brand_model.dart';
import 'package:most5dm/modules/home/model/repository/brand/brand_repositroy.dart';

class BrandService extends BrandRepository{

  List<BrandModel> brands = [];
  @override
  Future<List<BrandModel>> getAllBrand() {
    // TODO: implement getAllBrand
    throw UnimplementedError();
  }

  @override
  Future<List<BrandModel>> getAllBrandByCategoryId(int id) async{
    Response? response = await DioHelper.get(
      endPoint: GET_ALL_BRAND_BY_CATEGORY_ID,
      queryParameters: {'CategoryId': id},
    );
    List list = response!.data;
    for(var item in list){
      BrandModel brandModel = BrandModel.fromJson(item);
      brands.add(brandModel);
    }
    return brands;
  }

  @override
  Future<BrandModel> getBrandById(int brandId) async{
    Response? response = await DioHelper.get(
      endPoint: GET_BRAND_BY_ID,
      queryParameters: {'BrandId':brandId},
    );
    List<dynamic> list = response!.data;
    return BrandModel.fromJson(list.first);
  }

}