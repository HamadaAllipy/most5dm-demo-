import 'dart:convert';

import 'package:flutter/material.dart' show BuildContext, Navigator;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_states.dart';
import 'package:most5dm/modules/home/model/service/category/category_services.dart';
import 'package:most5dm/modules/home/model/service/main_category/main_category_service.dart';

import '../../../home/model/model/category/category_model.dart';
import '../../../home/model/model/main_category/main_category_model.dart';

class AddAdsCubit extends Cubit<AddAdsStates> {
  List<MainCategoryModel> _mainCategories = [];
  List<CategoryModel> _categories = [];
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  List<XFile>? _imageList;

  AddAdsCubit() : super(InitialAddAdsStates());

  static AddAdsCubit get(BuildContext context) => BlocProvider.of(context);

  void selectImageFromGallery() async {
    try {
      _imageList = await _picker.pickMultiImage();
      emit(SuccessSelectedImage());
    } on Exception catch (error) {
      print('Error $error');
      emit(ErrorSelectedImage(error.toString()));
    }
  }

  void selectImageFromCamera() async {
    try {
      _image = await _picker.pickImage(source: ImageSource.camera);
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
    } on Exception catch (e) {
      print('Error: $e');
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

  List<MainCategoryModel> get mainCategories => _mainCategories;
  List<CategoryModel> get categories => _categories;
}
