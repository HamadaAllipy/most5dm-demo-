import 'package:most5dm/modules/home/model/model/product_model.dart';

abstract class HomeRepository{

  Future<List<ProductModel>> getAllProducts();
}
