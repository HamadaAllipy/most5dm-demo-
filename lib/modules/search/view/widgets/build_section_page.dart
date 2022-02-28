import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/views/app_layout.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

import '../../../../constants/app_colors.dart';

class BuildSectionPage extends StatelessWidget {

  final AppCubit appCubit;

  const BuildSectionPage({Key? key, required this.appCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MainCategoryModel> mainCategories = appCubit.getMainCategories;
    bool firstTime = true;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.074),
      child: GridView.builder(
        itemCount: mainCategories.length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: context.width * 0.074,
          mainAxisSpacing: context.height * 0.034,
          childAspectRatio: 3 / 3,
        ),
        itemBuilder: (context, index) {
          if(firstTime){
            firstTime = !firstTime;
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColor.secondColor,
                    )),
                child: Center(
                  child: Text(
                    'الكل',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Color(0xFF2A2A2A),
                    ),
                  ),
                ),
              );
          }
          else {
            return InkWell(
              onTap: (){
                int mainCategoryId = mainCategories[index - 1].id as int;
                navigateToAndFinishByWidget(
                  context,
                  AppLayout(
                    idMainCategory: mainCategoryId,
                    indexSelectedMainCategory: index -1,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColor.secondColor,
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.017,
                      horizontal: context.width * 0.025),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        mainCategories[index - 1].iconUri.toString(),
                        height: context.height * 0.026,
                        width: context.width * 0.17,
                      ),
                      SizedBox(
                        height: context.height * 0.008,
                      ),
                      Text(
                        mainCategories[index - 1].name.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          height: 1,
                          color: AppColor.secondColor,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
