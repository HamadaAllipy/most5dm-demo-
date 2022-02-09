import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/add_ads/view/screen/select_brands.dart';
import 'package:most5dm/modules/add_ads/view/widgets/build_item_list_view.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

import '../../viewModel/cubit/add_ads_states.dart';

class SelectCategoriesScreen extends StatelessWidget {
  const SelectCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: BackgroundImage(
        child: BlocBuilder<AddAdsCubit, AddAdsStates>(
          builder: (context, state) {
            return Column(
              children: [
                _buildAppBar(context),
                Expanded(
                  child: state is! GetCategoriesLoadingState
                      ? BlocBuilder<AddAdsCubit, AddAdsStates>(
                        builder: (context, state) {
                          List<CategoryModel> categories =
                              AddAdsCubit.get(context).categories;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: categories.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              if (index.isOdd) {
                                return Divider(
                                  height: 0.5,
                                  color: AppColor.dimGrey,
                                );
                              } else {
                                return Container(
                                  color: Colors.white,
                                  child: _buildListItem(
                                    context,
                                    categories[index],
                                  ),
                                );
                              }
                            },
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

  Widget _buildAppBar(BuildContext context) {
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

  Widget _buildListItem(BuildContext context, CategoryModel categoryModel) {
    return ListTile(
      onTap: () {
        navigateToByWidget(context, SelectBrandScreen());
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
