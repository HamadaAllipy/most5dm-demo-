import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_app_bar_ios.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/add_ads/view/screen/add_ads_screen_.dart';
import 'package:most5dm/modules/add_ads/view/screen/select_brands.dart';
import 'package:most5dm/modules/add_ads/view/widgets/build_item_list_view.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

import '../../viewModel/cubit/add_ads_states.dart';

class SelectCategoriesScreen extends StatelessWidget {
  final MainCategoryModel mainCategoryModel;
  const SelectCategoriesScreen({Key? key, required this.mainCategoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: BackgroundImage(
        child: BlocBuilder<AddAdsCubit, AddAdsStates>(
          builder: (context, state) {
            final cubit = AddAdsCubit.get(context);
            return Column(
              children: [
                if(Platform.isIOS)
                  CustomAppBarIos(
                    middle: Text(
                      'اختر القسم',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    leading: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                      ),
                    ),
                    trailing: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        cubit.selectMainCategory(mainCategoryModel);
                        navigateToByWidget(context, AddAdsScreen_());
                      },
                      child: Icon(
                        CupertinoIcons.checkmark_alt,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (Platform.isAndroid)
                  _buildAppBar(context, cubit),
                Expanded(
                  child: state is! GetCategoriesLoadingState
                      ? Container(
                    color: Colors.white.withOpacity(0.7),
                        child: BlocBuilder<AddAdsCubit, AddAdsStates>(
                          builder: (context, state) {
                            List<CategoryModel> categories =
                                AddAdsCubit.get(context).categories;
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: categories.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                  return _buildListItem(
                                    context,
                                    cubit,
                                    categories[index],
                                  );
                              },
                              separatorBuilder: (context, index)=> Divider(
                                  height: 0.5,
                                  color: AppColor.dimGrey,
                                ),
                            );
                          },
                        ),
                      )
                      : Center(child: CircularProgressIndicator()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, AddAdsCubit cubit) {
    return CustomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'اختر القسم',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColor.blackLight,
                ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              cubit.selectMainCategory(mainCategoryModel);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return AddAdsScreen_();
                },
              ), (route) => route.isFirst);
              // navigateToByWidget(context, AddAdsScreen_());
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, AddAdsCubit cubit,CategoryModel categoryModel) {
    return ListTile(
      onTap: () async{
        cubit.getAllBrands(categoryModel.id as int);
        navigateToByWidget(context, SelectBrandScreen(categoryModel: categoryModel, mainCategoryModel: mainCategoryModel,));
      },
      title: Text(
        categoryModel.name.toString(),
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
        size: 19,
      ),
    );
  }
}
