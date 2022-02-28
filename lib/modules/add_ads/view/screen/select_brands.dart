import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_app_bar_ios.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/add_ads/view/screen/add_ads_screen.dart';
import 'package:most5dm/modules/add_ads/view/widgets/build_item_list_view.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_states.dart';
import 'package:most5dm/modules/home/model/model/brand/brand_model.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

import 'add_ads_screen_.dart';

class SelectBrandScreen extends StatelessWidget {

  final MainCategoryModel mainCategoryModel;
  final CategoryModel categoryModel;
  const SelectBrandScreen({Key? key, required this.categoryModel, required this.mainCategoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: BackgroundImage(
        child: Column(
          children: [
            if(Platform.isIOS)
              CustomAppBarIos(
                middle: Text(
                  'اختر النوع',
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
                trailing: BlocBuilder<AddAdsCubit, AddAdsStates>(
                  builder: (context, state) {
                    final cubit = AddAdsCubit.get(context);
                    return CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        cubit.selectCategory(categoryModel, mainCategoryModel);
                        navigateToByWidget(context, AddAdsScreen_());
                      },
                      child: Icon(
                    CupertinoIcons.checkmark_alt,
                    size: 28,
                    color: Colors.white,
                  ),
                );
  },
),
              ),
            if (Platform.isAndroid)
              _buildAppBar(context),
            BlocBuilder<AddAdsCubit, AddAdsStates>(
              builder: (context, state) {
                final cubit = AddAdsCubit.get(context);
                  return Expanded(
                    child: state is! GetBrandsLoadingState?
                    Container(
                      color: Colors.white.withOpacity(0.7),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: cubit.brands.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return _buildItem(context,  cubit.brands[index], cubit);
                        },
                        separatorBuilder: (context, index) => Divider(
                          height: 0.5,
                          color: AppColor.dimGrey,
                        ),
                      ),
                    ):
                    Center(child: CircularProgressIndicator()),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context){
    return CustomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
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


  Widget _buildItem(BuildContext context, BrandModel brandModel, AddAdsCubit cubit){
    return ListTile(
      onTap: (){
        cubit.selectBrand(categoryModel, mainCategoryModel, brandModel);
        navigateToByWidget(context, AddAdsScreen_());
      },
      title: Text(
        brandModel.name.toString(),
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,size: 19,),
    );
  }
}
