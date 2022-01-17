import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/favorite/view/screen/favorite_screen.dart';
import 'package:most5dm/modules/home/view/screen/home_screen.dart';
import 'package:most5dm/modules/wish_list/view/screen/wish_list_screen.dart';

class AppCubit extends Cubit<AppStates> {
  int index = 0;

  final List<String> keysTitles = [
    'home',
    'add_ads',
    'favorite',
    'wishes',
  ];
  final List<Widget> screens = [
    const HomeScreen(),
    const SizedBox(),
    const FavoriteScreen(),
    const WishListScreen(),
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

  AppCubit() : super(InitialAppState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  void changeBottomNav(int index) {

    if(index == 1){
      emit(AddAdsScreenState());
    }
    else{
      this.index = index;
      emit(ChangeBottomNavigation());
    }

  }

  void checkInternet()async{
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.none){
      emit(InternetDisconnectedState());
    }
    else {
      emit(InternetConnectedState());
    }
  }
}
