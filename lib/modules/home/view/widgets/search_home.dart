import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/modules/search/view/search_screen.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppCubit.get(context).getAllCategories();
        navigateToOutSideBottomNav(context: context, widget: SearchScreen(appCubit: AppCubit.get(context),));
      },
      child: SizedBox(
        height: context.height * 0.056,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SizedBox(
                width: context.width * 0.04,
              ),
               Icon(
                CupertinoIcons.search,
                color: AppColor.defaultGrey,
              ),
              SizedBox(
                width: context.width * 0.037,
              ),
              Text(
                'ابحث عن منتج',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
