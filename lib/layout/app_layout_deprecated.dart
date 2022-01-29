import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';

class AppLayoutDeprecated extends StatelessWidget {
  const AppLayoutDeprecated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){
        if(state is AddAdsScreenState){
          Navigator.pushNamed(context, AppString.addAdsScreen);
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.index],
          bottomNavigationBar: _bottomNavigationBar(context, cubit),
        );
      },
    );
  }

  Widget _bottomNavigationBar(BuildContext context,AppCubit cubit){
    return BottomNavigationBar(
      iconSize: 20,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(
            AppIcons.home,
          ),
          label: getLang(context, 'home'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            AppIcons.add_shopping_cart,
          ),
          label: getLang(context, 'add_ads'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            AppIcons.heart,
          ),
          label: getLang(context, 'favorite'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
          ),
          label: 'المزيد',
        ),
      ],
      currentIndex: cubit.index,
      onTap: (index) {
        cubit.changeBottomNav(index);
      },
    );
  }
}

