import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';

abstract class MainCategoryRepository{

  Future<List<MainCategoryModel>> getAllMainCategory();
  Future<MainCategoryModel> getMainCategoryById(int mainCategoryId);
}