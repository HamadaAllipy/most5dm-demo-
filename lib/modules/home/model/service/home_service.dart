import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/constants/end_points.dart';
import 'package:most5dm/modules/home/model/model/product_model.dart';
import 'package:most5dm/modules/home/model/repository/home_repository.dart';

class HomeApi extends HomeRepository{



  List<ProductModel> products = [];
  @override
  Future<List<ProductModel>> getAllProducts()async {
    try {
      Response? response = await DioHelper.get(
        endPoint: GET_ALL_PRODUCTS,
      );
     List<dynamic> responseProducts =  response!.data;

     for (var product in responseProducts) {
       products.add(ProductModel.fromJson(product));
     }

    } on Exception catch (e) {
      if(kDebugMode){
        print('Error: $e');
      }
    }
    return products;
  }

}