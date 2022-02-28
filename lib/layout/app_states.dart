import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';

abstract class AppStates{}
class InitialAppState extends AppStates{}
class ChangeBottomNavigation extends AppStates{}
class AddAdsScreenState extends AppStates{}

class InternetDisconnectedState extends AppStates{}
class InternetConnectedState extends AppStates{}



// home screen

class ToggleViewProductsHomeScreen extends AppStates{}
class GetHomeDataLoadingState extends AppStates{}
class GetHomeDataSuccessState extends AppStates{}
class GetHomeDataErrorState extends AppStates{
  final String error;
  GetHomeDataErrorState(this.error);
}

class GetAllMainCategorySuccess extends AppStates{
  final List<MainCategoryModel> mainCategory;
  GetAllMainCategorySuccess(this.mainCategory);
}
class GetAllMainCategoryError extends AppStates{}
class ToggleSearchOptionsButtonState extends AppStates{}
class HandlingToggleItemButtonState extends AppStates{}


class TryingAgainActionButton extends AppStates{}


class ErrorTryingActionButton extends AppStates{
  final String error;

  ErrorTryingActionButton(this.error);
}


class SuccessTryingActionButton extends AppStates{}


