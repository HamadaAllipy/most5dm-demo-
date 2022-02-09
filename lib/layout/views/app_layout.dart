import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/components/disconnected_screen.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/add_ads/view/screen/add_ads_screen_.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/auth/model/model/login_model.dart';
import 'package:most5dm/modules/home/model/service/products/products_services.dart';
import 'package:most5dm/modules/home/model/service/main_category/main_category_service.dart';
import 'package:most5dm/shared/widgets/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppLayout extends StatefulWidget {

  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: BlocProvider(
        create: (BuildContext context) =>
        AppCubit()
        ..checkInternet(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {
            if (state is AddAdsScreenState) {
              pushNewScreen(context, screen: BlocProvider(
                create: (context) => AddAdsCubit()..getMainCategories(),
                child: AddAdsScreen_(),
              ));
            }
          },
          builder: (BuildContext context, AppStates states) {
            if(states is InternetDisconnectedState){
              return const DisconnectedScreen();
            }
            var cubit = AppCubit.get(context);
            return Scaffold(
              key: _scaffoldKey,
              drawerScrimColor: Colors.transparent,
              drawer: buildCustomDrawer(),
              appBar: CustomAppBar(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: AppColor.defaultColor,
                      ),
                    ),
                    Image.asset(
                      'assets/images/most5dm.png',
                      height: context.height * 0.04,
                      width: context.width * 0.086,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Most',
                            style: TextStyle(
                              color: AppColor.secondColor,
                              fontSize: context.height * 0.027,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '5',
                            style: TextStyle(
                              color: AppColor.defaultColor,
                              fontSize: context.height * 0.027,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'dm',
                            style: TextStyle(
                              color: AppColor.secondColor,
                              fontSize: context.height * 0.027,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.02,
                    ),
                    AutoSizeText(
                      'بيع وشراء كل مستعمل',
                      style: TextStyle(
                        color: AppColor.secondColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      minFontSize: 18,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              body: PersistentTabView(
                context,
                hideNavigationBar: states is GetHomeDataLoadingState,
                controller: cubit.bottomNavController,
                screens: cubit.screens,
                items: cubit.navBarsItems,
                onItemSelected: (index) {
                  cubit.changeBottomNav(index);
                },
                padding: const NavBarPadding.only(
                  top: 6,
                ),
                confineInSafeArea: true,
                backgroundColor: Colors.white,
                handleAndroidBackButtonPress: true,
                resizeToAvoidBottomInset: true,
                stateManagement: true,
                hideNavigationBarWhenKeyboardShows: true,
                decoration: NavBarDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 20.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(0.0),
                  colorBehindNavBar: AppColor.secondColor,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: const ItemAnimationProperties(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: const ScreenTransitionAnimation(
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style15,
              ),
            );
          },
        ),
      ),
    );
  }


  Widget buildCustomDrawer(){
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight,
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
                          color: Colors.red
                      ),
                      child: Image.network(
                        'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300',
                        fit: BoxFit.cover,
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
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'الاقسام',
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
