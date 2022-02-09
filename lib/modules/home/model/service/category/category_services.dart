import 'package:dio/dio.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/constants/end_points.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/modules/home/model/repository/category/category_repository.dart';

class CategoryServices extends CategoryRepository {
  List<CategoryModel> categoryByMainId = [];
  List<CategoryModel> categories = [];

  @override
  Future<List<CategoryModel>> getAll() async{
    Response? response = await DioHelper.get(endPoint: GET_ALL_CATEGORY);
    List list = response!.data;
    for(var item in list){
      categories.add(CategoryModel.fromJson(item));
    }
    return categories;
  }

  @override
  Future<List<CategoryModel>> getCategoryByMainCategoryId(int id) async {
    await DioHelper.get(
      endPoint: GET_CATEGORY_BY_MAIN_CATEGORY_ID,
      queryParameters: {'MainCategoryId': id},
    ).then((value) {
      List list = value!.data;
      for(var item in list){
        categoryByMainId.add(CategoryModel.fromJson(item));
      }
    }).catchError((onError){
      print('Error:  ${onError.toString()}');
    });
    return categoryByMainId;
  }
}
