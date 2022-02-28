import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/modules/home/model/model/brand/brand_model.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/modules/home/model/model/products/product_model.dart';
import 'package:most5dm/modules/home/model/service/brand/brand_service.dart';
import 'package:most5dm/modules/home/model/service/category/category_services.dart';
import 'package:most5dm/modules/home/model/service/main_category/main_category_service.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {

  bool isVisible = false;
  late BrandModel brandModel;
  late CategoryModel categoryModel;
  late MainCategoryModel mainCategoryModel;
  ProductCubit() : super(InitialProductState());

  static ProductCubit get(BuildContext context) => BlocProvider.of(context);

  void toggleVisiblePhoneNumber() {
    isVisible = !isVisible;
    emit(ToggleVisiblePhoneNumber());
  }

  getProductDetails(ProductModel productModel) async{
    try {
      emit(ProductDetailsLoadingState());
      brandModel = await BrandService().getBrandById(productModel.brandId as int);
      categoryModel = await CategoryServices().getCategoryById(brandModel.categoryId as int);
      mainCategoryModel = await MainCategoryService().getMainCategoryById(categoryModel.mainCategoryId as int);
      emit(ProductDetailsSuccessState());
    } on Exception catch (e) {
      print('Error: $e');
      emit(ProductDetailsErrorState());
    }
    /// get city by id
  }
}
