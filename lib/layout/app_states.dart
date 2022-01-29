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