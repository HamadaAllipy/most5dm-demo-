import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/components/custom_app_bar_ios.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/layout/views/app_layout.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/add_ads/view/screen/select_brands.dart';
import 'package:most5dm/modules/add_ads/view/screen/select_categories.dart';
import 'package:most5dm/modules/add_ads/view/screen/select_city_screen.dart';
import 'package:most5dm/modules/add_ads/view/screen/select_main_categories.dart';
import 'package:most5dm/modules/add_ads/view/widgets/build_button.dart';
import 'package:most5dm/modules/add_ads/view/widgets/build_text_field_android.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_states.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class AddAdsScreen_ extends StatefulWidget {

  const AddAdsScreen_({Key? key}) : super(key: key);

  @override
  State<AddAdsScreen_> createState() => _AddAdsScreen_State();
}

class _AddAdsScreen_State extends State<AddAdsScreen_> {

  late MainCategoryModel mainCategoryModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AddAdsCubit.get(context);
    return WillPopScope(
      onWillPop: ()async{
        return await false;
      },
      child: CustomStatusBar(
        child: BackgroundImage(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(Platform.isIOS)
                  CustomAppBarIos(
                    middle: Text(
                      'اضف اعلان',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    leading: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        showCupertinoDialog(
                            context: context,
                            builder:(context){
                              return CupertinoAlertDialog(
                                title: Text(
                                  'إلغاء اضافه اعلان',
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                    color: AppColor.blackLight,
                                  ),
                                ),
                                content: Text(
                                  'هل انت متاكد من الغاء اضافه اعلان',
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                    color: AppColor.dimGrey,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'الغاء',
                                      style: TextStyle(
                                        color: AppColor.defaultColor,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      int count = 0;
                                      cubit.emit(InitialAddAdsStates());
                                      Navigator.popUntil(context, (route) => route.isFirst);
                                      // Navigator.of(context).popUntil((route) {
                                      //   return route.settings.name == AppString.editProfileScreen;
                                      // });
                                      // Navigator.popUntil(context, ModalRoute.withName('layout'));

                                      // Navigator.of(context).popUntil((context) {
                                      //   return count++ >= 2;
                                      // });
                                    },
                                    child: Text(
                                      'نعم',
                                      style: TextStyle(
                                        color: AppColor.defaultColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                        );
                      },
                      child: Icon(
                        CupertinoIcons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (Platform.isAndroid)
                  _buildAppBar(cubit),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: context.height * 0.095,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildSelectImage(),
                              BlocBuilder<AddAdsCubit, AddAdsStates>(
                                builder: (context, state) {
                                  return ListView.builder(
                                    itemCount: cubit.images.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          _buildSelectedImage(
                                              cubit.images[index]),
                                          InkWell(
                                            onTap: (){
                                              cubit.removeImage(index);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.only(
                                                start: 8,
                                              ),
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor: AppColor.blackLight,
                                                child: Icon(
                                                  Icons.clear,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildDivider(),
                      BlocBuilder<AddAdsCubit, AddAdsStates>(
                        buildWhen: (previousState, state) {
                          print('State now is ${state}');
                          if(state is SuccessSelectedImage){
                            return false;
                          }
                          else if(state is RemoveImage){
                            return false;
                          }
                          else if(state is PostAddAdsLoadingState){
                            return false;
                          }
                          else if(state is PostAddAdsSuccessState){
                            return false;
                          }
                          else if(state is PostAddAdsErrorState){
                            return false;
                          }
                          else{
                            return true;
                          }
                        },
                        builder: (context, state) {
                          if(state is SelectMainCategoryState){
                            return Column(
                              children: [
                                BuildButton(
                                  text: state.mainCategoryModel.name.toString(),
                                  onTap: () {
                                    navigateToByWidget(context, SelectMainCategoriesScreen(mainCategoriesModel: cubit.mainCategories));
                                  },
                                ),
                                _buildDivider(),
                                BuildButton(
                                  text: 'اختر القسم الفرعي',
                                  onTap: () {
                                    navigateToByWidget(context, SelectCategoriesScreen(mainCategoryModel: state.mainCategoryModel));
                                  },
                                ),
                                _buildDivider(),
                                BuildButton(
                                  text: 'اختر النوع',
                                  onTap: (){
                                    showToast('اختر القسم الفرعي اولا');
                                  },
                                ),
                              ],
                            );
                          }
                          else if(state is SelectCategoryState){
                            return Column(
                              children: [
                                BuildButton(
                                  text: state.mainCategoryModel.name.toString(),
                                  onTap: () {
                                    navigateToByWidget(context, SelectMainCategoriesScreen(mainCategoriesModel: cubit.mainCategories,),);
                                  },
                                ),
                                _buildDivider(),
                                BuildButton(
                                  text: state.categoryModel.name.toString(),
                                  onTap: () {
                                    navigateToByWidget(context, SelectCategoriesScreen(mainCategoryModel: state.mainCategoryModel,),);
                                  },
                                ),
                                _buildDivider(),
                                BuildButton(
                                  text: 'اختر النوع',
                                  onTap: (){
                                    navigateToByWidget(
                                      context,
                                      SelectBrandScreen(
                                        categoryModel: state.categoryModel,
                                        mainCategoryModel: state.mainCategoryModel,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          }
                          else if(state is SelectBrandState){
                            return Column(
                              children: [
                                BuildButton(
                                  text: state.mainCategoryModel.name.toString(),
                                  onTap: () {
                                    navigateToByWidget(context, SelectMainCategoriesScreen(mainCategoriesModel: cubit.mainCategories,),);
                                  },
                                ),
                                _buildDivider(),
                                BuildButton(
                                  text: state.categoryModel.name.toString(),
                                  onTap: () {
                                    navigateToByWidget(context, SelectCategoriesScreen(mainCategoryModel: state.mainCategoryModel,),);
                                  },
                                ),
                                _buildDivider(),
                                BuildButton(
                                  text: state.brandModel.name.toString(),
                                  onTap: (){
                                    navigateToByWidget(
                                      context,
                                      SelectBrandScreen(
                                        categoryModel: state.categoryModel,
                                        mainCategoryModel: state.mainCategoryModel,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          }
                            return BuildButton(
                              text: 'ما الذي تود بيعه',
                              onTap: () {
                                navigateToByWidget(
                                  context,
                                  SelectMainCategoriesScreen(
                                      mainCategoriesModel: cubit.mainCategories),
                                );
                              },
                            );
                        },
                      ),
                      _buildDivider(),
                      _buildNameAdsField(cubit),
                      _buildDivider(),
                      _buildDescribeAds(cubit),
                      _buildDivider(),
                      BuildButton(
                      text: cubit.cityModel?.name.toString()?? 'اختر المدينة',
                      onTap: () {
                        navigateToByWidget(context, SelectCityScreen());
                      },
                    ),
                      _buildDivider(),
                      _buildPriceField(cubit),
                      _buildDivider(),
                      _buildLongDescribeAds(cubit),
                      _buildDivider(),
                      BlocConsumer<AddAdsCubit, AddAdsStates>(
                        listener: (context, state){
                          if(state is PostAddAdsSuccessState){
                            navigateToAndFinishByWidget(context,AppLayout() );
                          }
                        },
                        builder: (context, state) {
                          return state is! PostAddAdsLoadingState
                              ? DefaultButton(
                                  onPressed: () {
                                    cubit.addProduct(
                                      name: cubit.nameAdsController.text,
                                      price:
                                          int.parse(cubit.requiredPriceController.text),
                                      productShortDesc:
                                          cubit.shortDescriptionController.text,
                                      productLongDesc:
                                          cubit.longDescriptionController.text,
                                    );
                                  },
                                  child: Text(
                                    'نشر الاعلان',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(color: AppColor.defaultColor,),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(AddAdsCubit cubit) {
    return CustomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'إلغاء اضافه اعلان',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: AppColor.blackLight,
                      ),
                    ),
                    content: Text(
                      'هل انت متاكد من الغاء اضافه اعلان',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: AppColor.dimGrey,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'الغاء',
                          style: TextStyle(
                            color: AppColor.defaultColor,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          cubit.emit(InitialAddAdsStates());
                          Navigator.popUntil(context, (route) => route.isFirst);
                          int count = 0;
                          // Navigator.popUntil(context, ModalRoute.withName(AppString.appLayout));
                          // Navigator.of(context).popUntil((context) {
                          //   return count++ >= 2;
                          // });
                        },
                        child: Text(
                          'نعم',
                          style: TextStyle(
                            color: AppColor.defaultColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.clear,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'اضف اعلان',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColor.blackLight,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => SizedBox(
        height: context.height * 0.008,
      );

  Widget _buildNameAdsField(AddAdsCubit cubit) {
    return Platform.isIOS
        ? DefaultTextForm(
            controller: cubit.nameAdsController,
            text: 'اسم الاعلان',
            borderRadius: 6,
            textInputType: TextInputType.text,
            textInputActionIos: TextInputAction.next,
          )
        : BuildTextFieldAndroid(
            hintText: 'اسم الاعلان',
            controller: cubit.nameAdsController,
          );
  }

  Widget _buildPriceField(AddAdsCubit cubit) {
    return Platform.isIOS
        ? DefaultTextForm(
            controller: cubit.requiredPriceController,
            text: 'السعر المطلوب',
            borderRadius: 6,
            textInputType: TextInputType.number,
            textInputActionIos: TextInputAction.next,
          )
        : BuildTextFieldAndroid(
            hintText: 'السعر المطلوب',
            controller: cubit.requiredPriceController,
          );
  }

  Widget _buildDescribeAds(AddAdsCubit cubit) {
    if (Platform.isIOS) {
      return Container(
        height: context.height * 0.12,
        child: DefaultTextForm(
          maxLines: 4,
          controller: cubit.shortDescriptionController,
          text: 'وصف الاعلان',
          textInputType: TextInputType.text,
          textInputActionIos: TextInputAction.next,
        ),
      );
    } else {
      return _buildDescribeForAndroid(
        controller: cubit.shortDescriptionController,
        height: context.height * 0.12,
        text: 'وصف الاعلان',
      );
    }
  }

  Widget _buildLongDescribeAds(AddAdsCubit cubit) {
    if (Platform.isIOS) {
      return Container(
        height: context.height * 0.207,
        child: DefaultTextForm(
          maxLines: 15,
          controller: cubit.longDescriptionController,
          text: 'وصف الاعلان بالتفصيل',
          textInputType: TextInputType.text,
          textInputActionIos: TextInputAction.done,
        ),
      );
    } else {
      return _buildDescribeForAndroid(
          controller: cubit.longDescriptionController,
          height: context.height * 0.207, text: 'وصف الاعلان بالتفصيل');
    }
  }

  Widget _buildDescribeForAndroid(
      {required double height, required String text, required TextEditingController controller}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(6)),
      child: TextField(
        maxLines: 2,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: context.height * 0.01,
            horizontal: context.width * 0.037,
          ),
          border: InputBorder.none,
          hintText: text,
          hintStyle: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }

  Widget _buildSelectImage() {
    return BlocBuilder<AddAdsCubit, AddAdsStates>(
      builder: (context, state) {
        final cubit = AddAdsCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.selectImagesFromCamera();
          },
          child: Container(
            height: context.height * 0.095,
            width: context.width * 0.205,
            decoration: BoxDecoration(
              color: AppColor.defaultColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColor.secondColor,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image,
                  color: AppColor.secondColor,
                ),
                Text(
                  'اضف صورة',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectedImage(File file) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: context.width * 0.018,
      ),
      child: Container(
        height: context.height * 0.095,
        width: context.width * 0.205,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColor.secondColor,
          ),
          image: DecorationImage(
            image: FileImage(
              file,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
