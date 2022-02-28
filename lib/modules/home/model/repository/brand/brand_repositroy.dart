import 'package:most5dm/modules/home/model/model/brand/brand_model.dart';

abstract class BrandRepository{

  Future<List<BrandModel>> getAllBrand();


  Future<List<BrandModel>> getAllBrandByCategoryId(int id);
  Future<BrandModel> getBrandById(int brandId);

}