import 'package:most5dm/modules/add_ads/Model/models/add_product_model.dart';
import 'package:most5dm/modules/home/model/model/products/product_model.dart';

abstract class ProductsRepository{

  Future<List<ProductModel>> getAllProducts();

  Future<List<ProductModel>> getAllProductsByBrandId(int brandId);

  Future<List<ProductModel>> getAllProductsByMainCategoryId(int mainCategoryId);

  Future<List<ProductModel>> getProductsBySearch(String text);

  Future<List<ProductModel>> getProductsBySortingRangePrice(int min, int max);
  Future<void> addProduct(AddProductModel addProductModel);
}
