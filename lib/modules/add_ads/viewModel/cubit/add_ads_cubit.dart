import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show BuildContext, Navigator, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/modules/add_ads/Model/models/add_product_model.dart';
import 'package:most5dm/modules/add_ads/Model/services/images_service.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_states.dart';
import 'package:most5dm/modules/home/model/model/brand/brand_model.dart';
import 'package:most5dm/modules/home/model/model/city/city_model.dart';
import 'package:most5dm/modules/home/model/service/brand/brand_service.dart';
import 'package:most5dm/modules/home/model/service/category/category_services.dart';
import 'package:most5dm/modules/home/model/service/city/city_services.dart';
import 'package:most5dm/modules/home/model/service/main_category/main_category_service.dart';
import 'package:most5dm/modules/home/model/service/products/products_services.dart';

import '../../../home/model/model/category/category_model.dart';
import '../../../home/model/model/main_category/main_category_model.dart';

class AddAdsCubit extends Cubit<AddAdsStates> {

  final TextEditingController nameAdsController = TextEditingController();
  final TextEditingController requiredPriceController = TextEditingController();
  final TextEditingController shortDescriptionController = TextEditingController();
  final TextEditingController longDescriptionController = TextEditingController();
  List<MainCategoryModel> _mainCategories = [];
  List<CategoryModel> _categories = [];
  List<BrandModel> _brands = [];
  List<String> _imagesUrls = [];
  List<CityModel>  _allCities = [];
  CityModel?  cityModel;
  BrandModel?  _brandModel;

  /// selected
  late  ImagePicker _imagePicker;
  XFile? _image;
  List<XFile>? _imageList;

  AddAdsCubit() : super(InitialAddAdsStates());

  List<CityModel> get allCities => _allCities;





  static AddAdsCubit get(BuildContext context) => BlocProvider.of(context);

  void selectImageFromGallery() async {
    try {
      _imageList = await _imagePicker.pickMultiImage();
      emit(SuccessSelectedImage());
    } on Exception catch (error) {
      print('Error $error');
      emit(ErrorSelectedImage(error.toString()));
    }
  }

  void selectImageFromCamera() async {
    try {
      _image = await _imagePicker.pickImage(source: ImageSource.camera);
      emit(SuccessSelectedImage());
    } on Exception catch (error) {
      print('Error $error');
      emit(ErrorSelectedImage(error.toString()));
    }
  }

  XFile? get image => _image;

  List<XFile>? get imageList => _imageList;

  /// APIs
  ///
  void getMainCategories() async {
    try {
      String value = CashHelper.getString(key: 'main_categories') as String;
      List decodeData = jsonDecode(value);
      for (var mainCategory in decodeData) {
        _mainCategories.add(MainCategoryModel.fromJson(mainCategory));
      }
      emit(GetMainCategoriesSuccessState());
    } on Exception catch (e) {
      print('Error: $e');
      emit(GetMainCategoriesErrorState());
    }
  }

  Future<void> getAllCategories(int mainCategoryId)async{
    try {
      emit(GetCategoriesLoadingState());
      _categories =  await CategoryServices().getCategoryByMainCategoryId(mainCategoryId);
      emit(GetCategoriesSuccessState());
    } on Exception catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getAllBrands(int categoryId)async{
    try {
      emit(GetBrandsLoadingState());
      _brands =  await BrandService().getAllBrandByCategoryId(categoryId);
      emit(GetBrandsSuccessState(_brands));
    } on Exception catch (e) {
      print('Error: $e');
    }
  }

  List<MainCategoryModel> get mainCategories => _mainCategories;
  List<CategoryModel> get categories => _categories;
  List<BrandModel> get brands => _brands;




  //// new class
  List<File> _images = [];
  List<File> get images => _images;

  void selectImagesFromCamera()async{
    try {
      _imagePicker = ImagePicker();
         List<XFile>? xFiles = await  _imagePicker.pickMultiImage();
         if(xFiles == null) return;
         else{
           for(var xFile in xFiles){
             File file = File(xFile.path);
             _images.add(file);
             UploadImage(file);
           }
           emit(SuccessSelectedImage());
         }
    } on Exception catch (e) {
      print('Error $e');
      emit(ErrorSelectedImage(e.toString()));
    }
  }

  void removeImage(int index)async{
    // remove file of image
    try {
      images.removeAt(index);
      // remove from server
      String response = await ImagesService().deleteByUri(_imagesUrls[index]);
      print('IMAGE STATE  ${response}');
      // remove url of image
      _imagesUrls.removeAt(index);
      emit(RemoveImage(),);
    } on Exception catch (e) {
      print('Error::: =>>> $e');
    }
  }

  void selectMainCategory(MainCategoryModel mainCategoryModel) {
    emit(SelectMainCategoryState(mainCategoryModel));
  }

  void selectCategory(CategoryModel categoryModel, MainCategoryModel mainCategoryModel) {
    emit(SelectCategoryState(categoryModel,mainCategoryModel ),);
  }

  void selectBrand(CategoryModel categoryModel, MainCategoryModel mainCategoryModel, BrandModel brandModel) {
    this._brandModel = brandModel;
    emit(SelectBrandState(categoryModel, mainCategoryModel, brandModel));
  }

  void UploadImage(File file) async{
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });
      String uriImage = await ImagesService().uploadImage(formData);
      print('URI_IMAGE ${uriImage}');
      _imagesUrls.add(uriImage);
    } on Exception catch (e) {
      print('Error:: =>> $e');
    }
  }


  void getAllCities()async{
    _allCities = await CityServices().getAll();
  }

  void selectCity(CityModel cityModel) {
    this.cityModel = cityModel;
  }

  void addProduct({
  required String name,
  required int price,
  required String productShortDesc,
  required String productLongDesc,

}){
    try {
      emit(PostAddAdsLoadingState());
      AddProductModel addProductModel = AddProductModel(
        name: name,
        nameAR: 'nameAR',
        price: price,
        productShortDesc: productShortDesc,
        productShortDescAR: 'productShortDescAR',
        productLongDesc: productLongDesc,
        productLongDescAR: 'productLongDescAR',
        brandId: _brandModel!.id as int,
        iconUri: _imagesUrls.first,
        cityId: cityModel!.id as int,
        images: _imagesUrls,
        // images: [],
        // cityId: 3,
        // brandId: 3,
      );
      ProductsService().addProduct(addProductModel).then(
            (value) {
              _imagesUrls = [];
              _images = [];
              nameAdsController.clear();
              shortDescriptionController.clear();
              longDescriptionController.clear();
              requiredPriceController.clear();
              cityModel = null;
              emit(PostAddAdsSuccessState());
            },
          );
    } on Exception catch (e) {
      emit(PostAddAdsErrorState(e.toString()));
      print('Error??=> $e');
    }
  }
}
