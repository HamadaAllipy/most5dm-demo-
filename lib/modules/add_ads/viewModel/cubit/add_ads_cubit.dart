import 'package:flutter/material.dart' show BuildContext, Navigator;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_states.dart';

class AddAdsCubit extends Cubit<AddAdsStates>{

  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  List<XFile>? _imageList;
  AddAdsCubit() : super(InitialAddAdsStates());

  static AddAdsCubit get(BuildContext context)=> BlocProvider.of(context);

  void selectImageFromGallery()async{
    try {
      _imageList = await _picker.pickMultiImage();
      emit(SuccessSelectedImage());

    } on Exception catch (error) {
      print('Error $error');
      emit(ErrorSelectedImage(error.toString()));
    }
  }

  void selectImageFromCamera()async{
    try {
      _image = await _picker.pickImage(source: ImageSource.camera);
      emit(SuccessSelectedImage());
    } on Exception catch (error) {
      print('Error $error');
      emit(ErrorSelectedImage(error.toString()));
    }
  }


  XFile? get image=> _image;
  List<XFile>? get imageList=> _imageList;
}