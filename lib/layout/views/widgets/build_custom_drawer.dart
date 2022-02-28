import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/search/view/search_screen.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class BuildCustomDrawer extends StatelessWidget {
  const BuildCustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final isAndroid = Platform.isAndroid;
    return Column(
      children: [
        SizedBox(
          // height: kToolbarHeight ,
          height: isAndroid? kToolbarHeight:context.height * 0.098,
        ),
        Expanded(
          child: Container(
            width: 300,
            padding:  EdgeInsets.all(16),
            color: AppColor.secondColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red),
                      child: BlocBuilder<AppCubit, AppStates>(
                        builder: (context, state) {
                          return Image.network(
                            true?
                            'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300'
                            : AppCubit.get(context).dataModel!.picture.toString(),
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'عمر محمد',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(
                  color: AppColor.dimGrey,
                  thickness: 1,
                ),
                SizedBox(
                  height: 16,
                ),
                BlocBuilder<AppCubit, AppStates>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () {
                        navigateToByWidget(
                          context,
                          SearchScreen(
                            appCubit: AppCubit.get(context),
                          ),
                        );
                      },
                      child: Text(
                        'الاقسام',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'اعلاناتي',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'تسجيل الخروج',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
