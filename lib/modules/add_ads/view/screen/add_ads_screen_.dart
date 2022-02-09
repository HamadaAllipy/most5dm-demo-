import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/add_ads/view/screen/select_main_categories.dart';
import 'package:most5dm/modules/add_ads/view/widgets/build_button.dart';
import 'package:most5dm/modules/add_ads/view/widgets/build_text_field_android.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_states.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class AddAdsScreen_ extends StatefulWidget {
  const AddAdsScreen_({Key? key}) : super(key: key);

  @override
  State<AddAdsScreen_> createState() => _AddAdsScreen_State();
}

class _AddAdsScreen_State extends State<AddAdsScreen_> {
  final TextEditingController nameAdsController = TextEditingController();
  final TextEditingController describeAdsController = TextEditingController();
  final TextEditingController longDescribeAdsController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: BackgroundImage(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: kToolbarHeight,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSelectImage(),
                          _buildDivider(),
                          BlocBuilder<AddAdsCubit, AddAdsStates>(
                            builder: (context, state) {
                              return BuildButton(
                                text: 'ما الذي تود بيعه',
                                onTap: () {
                                  navigateToAndFinishByWidget(
                                    context,
                                    SelectMainCategoriesScreen(mainCategoriesModel: AddAdsCubit.get(context).mainCategories),
                                  );
                                },
                              );
                            },
                          ),
                          _buildDivider(),
                          _buildNameAdsField(),
                          _buildDivider(),
                          _buildDescribeAds(),
                          _buildDivider(),
                          BuildButton(
                            text: 'اختر المدينة',
                            onTap: () {},
                          ),
                          _buildDivider(),
                          _buildPriceField(),
                          _buildDivider(),
                          _buildLongDescribeAds(),
                          _buildDivider(),
                          DefaultButton(
                            onPressed: () {},
                            child: Text(
                              'نشر الاعلان',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildAppBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return CustomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
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
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => SizedBox(
        height: context.height * 0.008,
      );

  Widget _buildNameAdsField() {
    return Platform.isIOS
        ? DefaultTextForm(
            controller: nameAdsController,
            text: 'اسم الاعلان',
            borderRadius: 6,
            textInputType: TextInputType.text,
            textInputActionIos: TextInputAction.next,
          )
        : BuildTextFieldAndroid(
            hintText: 'اسم الاعلان',
            controller: nameAdsController,
          );
  }

  Widget _buildPriceField() {
    return Platform.isIOS
        ? DefaultTextForm(
            controller: nameAdsController,
            text: 'السعر المطلوب',
            borderRadius: 6,
            textInputType: TextInputType.text,
            textInputActionIos: TextInputAction.next,
          )
        : BuildTextFieldAndroid(
            hintText: 'السعر المطلوب',
            controller: nameAdsController,
          );
  }

  Widget _buildDescribeAds() {
    if (Platform.isIOS) {
      return Container(
        height: context.height * 0.12,
        child: DefaultTextForm(
          maxLines: 4,
          controller: describeAdsController,
          text: 'وصف الاعلان',
          textInputType: TextInputType.text,
          textInputActionIos: TextInputAction.next,
        ),
      );
    } else {
      return _buildDescribeForAndroid(
        height: context.height * 0.12,
        text: 'وصف الاعلان',
      );
    }
  }

  Widget _buildLongDescribeAds() {
    if (Platform.isIOS) {
      return Container(
        height: context.height * 0.207,
        child: DefaultTextForm(
          maxLines: 15,
          controller: longDescribeAdsController,
          text: 'وصف الاعلان بالتفصيل',
          textInputType: TextInputType.text,
          textInputActionIos: TextInputAction.done,
        ),
      );
    } else {
      return _buildDescribeForAndroid(
          height: context.height * 0.207, text: 'وصف الاعلان بالتفصيل');
    }
  }

  Widget _buildDescribeForAndroid(
      {required double height, required String text}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(6)),
      child: TextField(
        maxLines: 2,
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
    return Container(
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
    );
  }
}
