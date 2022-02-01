import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/account/view/screens/view_profile_screen.dart';
import 'package:most5dm/modules/account/view/screens/edit_profile_screen.dart';
import 'package:most5dm/modules/favorite/view/screen/favorite_screen.dart';
import 'package:most5dm/modules/home/model/model/product_model.dart';
import 'package:most5dm/modules/home/model/repository/home_repository.dart';
import 'package:most5dm/modules/home/model/service/home_service.dart';
import 'package:most5dm/modules/home/view/screen/home_screen.dart';
import 'package:most5dm/modules/home/view/screen/home_screen_.dart';
import 'package:most5dm/modules/home/viewModel/home_cuibt.dart';
import 'package:most5dm/modules/more/view/screens/moreScreen.dart';
import 'package:most5dm/modules/my_purchases%20/my_purchases_screen.dart';
import 'package:most5dm/modules/wish_list/view/screen/wish_list_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppCubit extends Cubit<AppStates> {
  int index = 0;

  bool _isListView = CashHelper.getBool(key: 'view_products')?? false;

  List<ProductModel> _productHome = [];
  final PersistentTabController? _bottomNavController =
      PersistentTabController();

  PersistentTabController? get bottomNavController => _bottomNavController;

  final List<String> keysTitles = [
    'home',
    'add_ads',
    'favorite',
    'wishes',
  ];
  final List<Widget> screens = [
    const HomeScreen_(),
    const ViewProfileScreen(),
    const SizedBox(),
    const FavoriteScreen(),
    const MoreScreen(),
  ];
  List<PreferredSizeWidget> appBar = [
    AppBar(
      bottom: const TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.cloud_outlined),
          ),
          Tab(
            icon: Icon(Icons.beach_access_sharp),
          ),
          Tab(
            icon: Icon(Icons.brightness_5_sharp),
          ),
        ],
      ),
    ),
    AppBar(),
    AppBar(),
    AppBar(),
  ];

  final List<PersistentBottomNavBarItem>? _navBarsItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(
        AppIcons.home,
      ),
      title: 'الرئيسية',
      textStyle: TextStyle(
        height: 1,
      ),
      inactiveColorPrimary: AppColor.secondColor,
      activeColorSecondary: AppColor.defaultColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        AppIcons.user,
      ),
      title: 'حسابي',
      textStyle: TextStyle(
        height: 1,
      ),
      inactiveColorPrimary: AppColor.secondColor,
      activeColorSecondary: AppColor.defaultColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.add_box,
        color: Colors.white,
      ),
      title: 'اضافه اعلان',
      textStyle: TextStyle(
        height: 1,
      ),
      inactiveColorPrimary: AppColor.secondColor,
      inactiveColorSecondary: Colors.red,
      activeColorSecondary: AppColor.secondColor,
      activeColorPrimary: AppColor.secondColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.favorite,
      ),
      textStyle: TextStyle(
        height: 1,
      ),
      title: 'المفضلة',
      inactiveColorPrimary: AppColor.secondColor,
      activeColorSecondary: AppColor.defaultColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.menu,
      ),
      title: 'مشترياتي',
      textStyle: TextStyle(
        height: 1,
      ),
      inactiveColorPrimary: AppColor.secondColor,
      activeColorSecondary: AppColor.defaultColor,
    ),
  ];

  List<PersistentBottomNavBarItem>? get navBarsItems => _navBarsItems;

  AppCubit() : super(InitialAppState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  void changeBottomNav(int index) {
    if (index == 2) {
      bottomNavController!.jumpToTab(0);
      emit(AddAdsScreenState());
      print('Add Ads SCREEN');
    } else {
      this.index = index;
      // emit(ChangeBottomNavigation());
    }
  }

  void checkInternet() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      emit(InternetDisconnectedState());
    } else {
      emit(InternetConnectedState());
    }
  }

  getHomeData(HomeRepository homeRepository) {
    emit(GetHomeDataLoadingState());
    Future<List<ProductModel>> products = homeRepository.getAllProducts();
    products.then((value) {
      _productHome = value;
      emit(GetHomeDataSuccessState());
    }).catchError((onError) {
      print('Error: $onError');
      showToast('Error: $onError');
    });
  }

  void toggleViewProduct() {
    try {
      _isListView = !_isListView;
      CashHelper.toCash(key: 'view_products', value: _isListView);
      emit(ToggleViewProductsHomeScreen());
    } on Exception catch (e) {
      if(kDebugMode){
        print('Error: $e');
      }
    }
  }

  bool get isListView => _isListView;

  List<ProductModel> get productsHome => _productHome;


}
