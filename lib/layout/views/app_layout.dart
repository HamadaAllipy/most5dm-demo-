import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:most5dm/layout/views/widgets/build_custom_drawer.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar_adaptive.dart';
import 'package:most5dm/modules/add_ads/view/screen/add_ads_screen_.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/auth/model/model/login_model.dart';
import 'package:most5dm/modules/home/model/service/products/products_services.dart';
import 'package:most5dm/modules/home/model/service/main_category/main_category_service.dart';
import 'package:most5dm/shared/widgets/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppLayout extends StatefulWidget {

  final int? idMainCategory;
  final int? indexSelectedMainCategory;
  const AppLayout({Key? key, this.idMainCategory, this.indexSelectedMainCategory,}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: BlocProvider(
        create: (BuildContext context) {
          /// navigate from searchScreen to home page
          if(widget.idMainCategory != null){
            return AppCubit()..checkInternet(idMainCategory: widget.idMainCategory, indexSelectedMainCategory: widget.indexSelectedMainCategory);
          }
          else{
            /// first time
            return AppCubit()..checkInternet();
          }
        },
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {
            if (state is AddAdsScreenState) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     settings: RouteSettings(name: 'layout'),
              //     builder: (context){
              //       return  AddAdsScreen_();
              //     },
              //   ),
              // );
              pushNewScreenWithRouteSettings(
                context,
                settings: RouteSettings(name: AppString.appLayout),
                screen: AddAdsScreen_(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
              // pushNewScreen(
              //   context,
              //   customPageRoute: RouteSettings(name: "Foo"),
              //   screen: BlocProvider(
              //     create: (context) => AddAdsCubit()..getMainCategories(),
              //     child: AddAdsScreen_(),
              //   ),
              // );
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
              drawer: BuildCustomDrawer(),
              body: Column(
                children: [
                  CustomAppBarAdaptive(
                    scaffoldKey: _scaffoldKey,
                  ),
                  Expanded(
                    child: PersistentTabView(
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}
