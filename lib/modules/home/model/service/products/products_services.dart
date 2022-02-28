import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/constants/end_points.dart';
import 'package:most5dm/modules/add_ads/Model/models/add_product_model.dart';
import 'package:most5dm/modules/home/model/model/products/product_model.dart';
import 'package:most5dm/modules/home/model/repository/products/products_repository.dart';

class ProductsService extends ProductsRepository {
  List<ProductModel> products = [];

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      Response? response = await DioHelper.get(
        endPoint: GET_ALL_PRODUCTS,
      );
      List<dynamic> responseProducts = response!.data;

      for (var product in responseProducts) {
        products.add(ProductModel.fromJson(product));
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllProductsByBrandId(int brandId) async {
    Response? response = await DioHelper.get(
      endPoint: GET_ALL_PRODUCTS_BY_BRAND_ID,
      queryParameters: {'BrandId': brandId},
    );
    List<dynamic> responseProducts = response!.data;
    for (var product in responseProducts) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllProductsByMainCategoryId(
      int mainCategoryId) async {
    Response? response = await DioHelper.get(
      endPoint: GET_ALL_PRODUCTS_BY_MAIN_CATEGORY_ID,
      queryParameters: {'MainCategoryId': mainCategoryId},
    );
    List<dynamic> responseProducts = response!.data;
    for (var product in responseProducts) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getProductsBySearch(String text) async {
    List<ProductModel> products = [];
    Response? response = await DioHelper.postData(
      endPoint: GET_PRODUCT_BY_SEARCH,
      data: {'searchText': text},
    );
    for (var product in response!.data) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getProductsBySortingRangePrice(int min, int max) {
    // TODO: implement getProductsBySortingRangePrice
    throw UnimplementedError();
  }

  @override
  Future<void> addProduct(AddProductModel addProductModel) async{
    try {
      Response? response = await DioHelper.post(
        endPoint: ADD_PRODUCT,
        data: addProductModel.toJson(),
      );
      print('product add Successfully');
      print(response!.data);

    } on Exception catch (e) {
      print('Error -->> $e');
    }
  }


}
