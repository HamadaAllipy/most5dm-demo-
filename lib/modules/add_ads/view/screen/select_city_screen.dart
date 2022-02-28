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
import 'package:most5dm/modules/home/model/model/city/city_model.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

import '../../viewModel/cubit/add_ads_states.dart';

class SelectCityScreen extends StatelessWidget {
  const SelectCityScreen({Key? key}) : super(key: key);

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
                      'اختر المدينة',
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
                  ),
                if (Platform.isAndroid)
                  _buildAppBar(context, cubit),
                Expanded(
                  child: cubit.allCities.isNotEmpty
                      ? BlocBuilder<AddAdsCubit, AddAdsStates>(
                          builder: (context, state) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: cubit.allCities.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.white,
                                  child: _buildListItem(
                                    context,
                                    cubit,
                                    cubit.allCities[index],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(
                                height: 0.5,
                                color: AppColor.dimGrey,
                              ),
                            );
                          },
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
            'اختر المدينة',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: AppColor.blackLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, AddAdsCubit cubit,CityModel cityModel) {
    return ListTile(
      onTap: () async{
        cubit.selectCity(cityModel);
        navigateToByWidget(context, AddAdsScreen_());
      },
      title: Text(
        cityModel.name.toString(),
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
