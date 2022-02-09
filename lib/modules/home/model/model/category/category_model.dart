import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';

class CategoryModel{

  int? id;
  String? name;
  String? iconUri;
  int? mainCategoryId;
  MainCategoryModel? mainCategory;

  CategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    iconUri = json['iconUri'];
    if(json['mainCategory'] != null){
      mainCategory = MainCategoryModel.fromJson(json['mainCategory']);
    }
    mainCategoryId = json['mainCategoryId'];
  }
}