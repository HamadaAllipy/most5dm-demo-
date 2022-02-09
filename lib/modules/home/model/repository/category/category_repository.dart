import 'package:most5dm/modules/home/model/model/category/category_model.dart';

abstract class CategoryRepository{

  Future<List<CategoryModel>> getAll();


  Future<List<CategoryModel>> getCategoryByMainCategoryId(int id);
}