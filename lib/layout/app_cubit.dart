import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/account/view/screens/view_profile_screen.dart';
import 'package:most5dm/modules/auth/model/model/login_model.dart';
import 'package:most5dm/modules/favorite/view/screen/favorite_screen.dart';
import 'package:most5dm/modules/home/model/model/brand/brand_model.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/modules/home/model/model/city/city_model.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/modules/home/model/model/products/product_model.dart';
import 'package:most5dm/modules/home/model/repository/products/products_repository.dart';
import 'package:most5dm/modules/home/model/repository/main_category/main_category_repository.dart';
import 'package:most5dm/modules/home/model/service/brand/brand_service.dart';
import 'package:most5dm/modules/home/model/service/category/category_services.dart';
import 'package:most5dm/modules/home/model/service/city/city_services.dart';
import 'package:most5dm/modules/home/model/service/main_category/main_category_service.dart';
import 'package:most5dm/modules/home/model/service/products/products_services.dart';
import 'package:most5dm/modules/home/view/screen/home_screen_.dart';
import 'package:most5dm/modules/home/view/widgets/carousel/build_carousel_slider.dart';
import 'package:most5dm/modules/home/view/widgets/grid_view_products.dart';
import 'package:most5dm/modules/home/view/widgets/list_view_products.dart';
import 'package:most5dm/modules/home/view/widgets/row_categories_home.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_list_products.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_panel.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_product.dart';
import 'package:most5dm/modules/more/view/screens/moreScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());

  /// Variables
  int index = 0;
  int indexMainCategorySearchScreen = 0;
  int? indexOfRowMainCategory;
  bool _isListView = CashHelper.getBool(key: 'view_products')?? false;
  bool enableSearchOptionButton = false;
///Variables apis
  List<MainCategoryModel> _mainCategoryList = [];
  List<CategoryModel> _categories = [];
  List<ProductModel> _productsHome = [];
  List<CityModel> _cities = [];
  DataModel? _dataModel;

  final PersistentTabController? _bottomNavController = PersistentTabController();
  final List<Widget> screens = [
    const HomeScreen(),
    const ViewProfileScreen(),
    const SizedBox(),
    const FavoriteScreen(),
    const MoreScreen(),
  ];
  final List<PersistentBottomNavBarItem>? _navBarsItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(
        AppIcons.home,
      ),
      title: 'الرئيسية',
      textStyle: const TextStyle(
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
      textStyle: const TextStyle(
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
      textStyle: const TextStyle(
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
      textStyle: const TextStyle(
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
      textStyle: const TextStyle(
        height: 1,
      ),
      inactiveColorPrimary: AppColor.secondColor,
      activeColorSecondary: AppColor.defaultColor,
    ),
  ];


  /// Functions
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  void changeBottomNav(int index) {
    if (index == 2) {
      bottomNavController!.jumpToTab(0);
      emit(AddAdsScreenState());
    } else {
      this.index = index;
      // emit(ChangeBottomNavigation());
    }
  }

  void checkInternet({int? idMainCategory, int? indexSelectedMainCategory}) async {
    emit(TryingAgainActionButton());
    getUserInfo();
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      // offline
      emit(InternetDisconnectedState());
    }
    else {
      // online
      if(idMainCategory != null){
        emit(InternetConnectedState());
        handlingToggleItemButton(indexSelectedMainCategory!);
        getAllDataHome(
          productsRepository: ProductsService(),
          mainCategoryRepository: MainCategoryService(),
          idMainCategory: idMainCategory,
        );
      }
      else{
        emit(InternetConnectedState());
        getAllDataHome(productsRepository: ProductsService(),mainCategoryRepository : MainCategoryService());
      }
    }
  }

  void tryAgainAction()async{
    emit(TryingAgainActionButton());
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.none){
      emit(ErrorTryingActionButton('تاكد من متصل بالانترنت'));
    }
    else{
      emit(SuccessTryingActionButton());
    }
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
  void actionButtonAll()async{
    disableSearchOptionsButton();
    // emit(GetHomeDataLoadingState());
    // _productsHome = await ProductsService().getAllProducts();
    // _cities = await CityServices().getAll();
    // print('Button all ${cities.length}');
    _cities = [];
    getAllDataHome(productsRepository: ProductsService(), mainCategoryRepository: MainCategoryService());
    // emit(GetHomeDataSuccessState());

  }
  void disableSearchOptionsButton() {
    enableSearchOptionButton = false;
    emit(ToggleSearchOptionsButtonState());
  }
  void enableSearchOptionButtons(int indexOfRowMainCategory){
    this.indexOfRowMainCategory = indexOfRowMainCategory;
    enableSearchOptionButton= true;
  }

  /// APIs FUNCTION
  ///
  /// this is importing function its provide data to home page [Main Categories, Products] on the same time!!!!
  /// parameters [productsRepository] and [mainCategoryRepository] dependency injection,
  /// When this function is called, send objects from subclasses that inherit from abstract classes
  void getAllDataHome({
  required ProductsRepository productsRepository,
    required MainCategoryRepository mainCategoryRepository,
    int? idMainCategory,
})async{

    /// when getting data its emit [GetHomeDataSuccessState] to [HomeScreen] ,
    /// rebuild widgets [ShimmerAdsPanel] and [ShimmerGridViewProduct] or [ShimmerListProducts]
    /// [_buildRowMainCategoriesShimmer]
    emit(GetHomeDataLoadingState());
    var responses = Future.wait(
      [
        idMainCategory == null
            ? productsRepository.getAllProducts()
            : productsRepository.getAllProductsByMainCategoryId(idMainCategory),
        mainCategoryRepository.getAllMainCategory(),
      ],
    );
    responses.then((value)async {
      _productsHome = value[0] as List<ProductModel>;
      for(ProductModel product in _productsHome){
        List list = await CityServices().getCityByCityId(product.cityId as int);
        _cities.add(list.first);
      }
      _mainCategoryList = value[1] as List<MainCategoryModel>;
      String encodeData = jsonEncode(_mainCategoryList);
      CashHelper.toCash(key: 'main_categories', value: encodeData);
      /// after that in case Success to Get Data emit [GetHomeDataSuccessState]
      /// rebuild [BuildCarouselSlider] and [GridViewProducts] or[ListViewProducts]
      emit(GetHomeDataSuccessState());
    }).catchError((onError){
      print('HAMADA $onError');
      emit(InternetDisconnectedState());
      // emit(GetHomeDataErrorState(onError));
    });
  }

  void getAllCategories()async{
    _categories  = await CategoryServices().getAll();
  }
  Future<List<CategoryModel>> selectCategoryByIdMainCategory(int id)async{
    return await CategoryServices().getCategoryByMainCategoryId(id);
  }

  Future<List<BrandModel>> selectBrandByIdCategory(int id)async{
    return await BrandService().getAllBrandByCategoryId(id);;
  }

  void getProductsAfterFilter(int brandId) async{
    emit(GetHomeDataLoadingState());
   _productsHome = await ProductsService().getAllProductsByBrandId(brandId);
    _cities = [];
    for(ProductModel product in _productsHome){
      List list = await CityServices().getCityByCityId(product.cityId as int);
      _cities.add(list.first);
    }
   emit(GetHomeDataSuccessState());
  }

  void getProductsAfterSelectMainCategory(int mainCategoryId)async{

    try {
      emit(GetHomeDataLoadingState());
      _productsHome = await ProductsService().getAllProductsByMainCategoryId(mainCategoryId);
      _cities = [];
      for(ProductModel product in _productsHome){
        List list = await CityServices().getCityByCityId(product.cityId as int);
        _cities.add(list.first);
      }
      emit(GetHomeDataSuccessState());
    } on Exception catch (e) {
      emit(InternetDisconnectedState());
      print('Error $e');
    }
  }

  /// * getter
  /// list of products
  List<ProductModel> get productsHome => _productsHome;
  /// is list view or gridview for displays products
  bool get isListView => _isListView;

  /// list of main category
  List<MainCategoryModel> get getMainCategories => _mainCategoryList;

  PersistentTabController? get bottomNavController => _bottomNavController;
  List<CityModel> get cities => _cities;
  List<CategoryModel> get categories => _categories;

  List<PersistentBottomNavBarItem>? get navBarsItems => _navBarsItems;

  DataModel? get dataModel => _dataModel;

  void handlingToggleItemButton(int index) {
    handleTap(index,'single');
    // emit(HandlingToggleItemButtonState());
  }
  Set active = {true};
  bool selectAll = true;
  bool selectCategory = false;
  void handleTap(index , String single) {
    var list = active.toList();
    if(list[0] != index){
      active.contains(index) ? active.remove(index): active = {index, single};
    }
  }

  void handlingToggleAllButton(){
      if(active.contains('single')){
        if(selectAll){
          active = {true};
        }
        else{
          selectAll = !selectAll;
          active = {true};
        }
      }
      else{
        if(active.contains(true)){

        }
        else{
          selectAll = !selectAll;
          active = {selectAll};
        }

      }
  }

  void getUserInfo() {
    try {
      Map<String,dynamic> userMap = jsonDecode(getUserModel()!) as Map<String, dynamic>;
      print('VIEW PROFILE SCREEN $userMap');
      _dataModel = DataModel.fromJson(userMap);
    } on Exception catch (e) {
      print(
        'ERROR =>>> $e',
      );
    }
  }


  String? getUserModel(){
    return CashHelper.getString(key: 'user');
  }

}
