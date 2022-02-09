import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/add_ads/view/screen/select_categories.dart';
import 'package:most5dm/modules/add_ads/view/widgets/build_item_list_view.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_states.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../../home/model/model/main_category/main_category_model.dart';

class SelectMainCategoriesScreen extends StatelessWidget {

  final List<MainCategoryModel> mainCategoriesModel;

  const SelectMainCategoriesScreen(
      {Key? key, required this.mainCategoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: BackgroundImage(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Container(
                color: Colors.white,
                child: BlocBuilder<AddAdsCubit, AddAdsStates>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: mainCategoriesModel.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        if (index.isOdd) {
                          return Divider(
                            height: 0.5,
                            color: AppColor.dimGrey,
                          );
                        } else {
                          return _buildListItem(
                            context,
                            mainCategoriesModel[index],
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
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
            style: Theme
                .of(context)
                .textTheme
                .headline6!
                .copyWith(
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

  Widget _buildListItem(BuildContext context,
      MainCategoryModel mainCategoryModel) {
    return ListTile(
      onTap: () async {
        AddAdsCubit.get(context).getAllCategories(mainCategoryModel.id as int);
        navigateToByWidget(context, SelectCategoriesScreen(),);
      },
      title: Text(
        mainCategoryModel.name.toString(),
        style: Theme
            .of(context)
            .textTheme
            .headline6,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
        size: 19,
      ),
    );
  }
}
