import 'package:most5dm/modules/home/model/model/brand/brand_model.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/modules/home/model/model/city/city_model.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';

abstract class AddAdsStates{}

class InitialAddAdsStates extends AddAdsStates{}

class SuccessSelectedImage extends AddAdsStates{}
class ErrorSelectedImage extends AddAdsStates{
  final String error;

  ErrorSelectedImage(this.error);

}
class RemoveImage extends AddAdsStates{}

class GetMainCategoriesSuccessState extends AddAdsStates{}
class GetMainCategoriesErrorState extends AddAdsStates{}


class GetCategoriesSuccessState extends AddAdsStates{}
class GetCategoriesLoadingState extends AddAdsStates{}
class SelectMainCategoryState extends AddAdsStates{
  final MainCategoryModel mainCategoryModel;

  SelectMainCategoryState(this.mainCategoryModel);
}

class SelectCategoryState extends AddAdsStates{
  final MainCategoryModel mainCategoryModel;
  final CategoryModel categoryModel;

  SelectCategoryState(this.categoryModel, this.mainCategoryModel);
}

class SelectBrandState extends AddAdsStates{
  final MainCategoryModel mainCategoryModel;
  final CategoryModel categoryModel;
  final BrandModel brandModel;
  SelectBrandState(this.categoryModel, this.mainCategoryModel, this.brandModel);
}



class GetBrandsSuccessState extends AddAdsStates{
  final List<BrandModel> brands;

  GetBrandsSuccessState(this.brands);
}
class GetBrandsLoadingState extends AddAdsStates{}
class GetAllCityState extends AddAdsStates{}
class SelectCityState extends AddAdsStates{
  final CityModel cityModel;

  SelectCityState(this.cityModel);
}

class PostAddAdsLoadingState extends AddAdsStates{}
class PostAddAdsSuccessState extends AddAdsStates{}
class PostAddAdsErrorState extends AddAdsStates{
  final String error;

  PostAddAdsErrorState(this.error);
}