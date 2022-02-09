import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/constants/end_points.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/modules/home/model/repository/main_category/main_category_repository.dart';
import 'package:most5dm/utils/utils.dart';

class MainCategoryService extends MainCategoryRepository{

  final List<MainCategoryModel> _mainCategoryList = [];
  @override
  Future<List<MainCategoryModel>> getAllMainCategory() async{
      Response? response = await DioHelper.get(endPoint: GET_ALL_MAIN_CATEGORY);
        for (var element in response!.data) {
          MainCategoryModel mainCategoryModel = MainCategoryModel.fromJson(element);
          _mainCategoryList.add(mainCategoryModel);
        }
        return _mainCategoryList;
  }
}