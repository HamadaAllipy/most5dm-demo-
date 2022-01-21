import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/auth/view/screen/bank_account_screen.dart';
import 'package:most5dm/modules/auth/view/screen/login_screen_.dart';
import 'package:most5dm/modules/auth/view/screen/register_screen_.dart';
import 'package:most5dm/modules/forget_password/view/screen/enter_code_screen.dart';
import 'package:most5dm/modules/forget_password/view/screen/enter_new_password_screen.dart';
import 'package:most5dm/modules/forget_password/view/screen/enter_phone_screen.dart';
import 'package:most5dm/modules/forget_password/view/screen/forget_password_screen.dart';
import 'package:most5dm/modules/splash/view/screens/splash_screen.dart';
import 'package:most5dm/constants/internet_checker.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_layout.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/add_ads/view/screen/add_ads_screen.dart';
import 'package:most5dm/modules/auth/view/screen/login_screen.dart';
import 'package:most5dm/modules/auth/view/screen/register_screen.dart';
import 'package:most5dm/modules/categories/categories_screen.dart';
import 'package:most5dm/components/disconnected_screen.dart';

import 'app_string.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings router) {
    switch (router.name) {
      case AppString.loginScreen:
        return _navigateLoginScreen();

      /// go to {Register Screen}
      case AppString.registerScreen:
        return _navigateRegisterScreen();

      /// go to {App Layout Screen}
      case AppString.appLayout:
        return _navigateAppLayoutScreen();

      /// go to {Category Screen}
      case AppString.categoriesScreen:
        return _navigateCategoriesScreen();

      /// go to {Add Ads Screen}
      case AppString.addAdsScreen:
        return _navigateAddAdsScreen();

      /// go to {Disconnected Screen}
      case AppString.disconnectedScreen:
        return _navigateDisconnectedScreen();
      case AppString.splashScreen:
        return _navigateSplashScreen();
      case AppString.bankAccountScreen:
        return _navigateBankAccountScreen();
      case AppString.forgetPasswordScreen:
        return _navigateForgetPasswordScreen();
      case AppString.enterPhoneScreen:
        return _navigateEnterPhoneScreen();
      case AppString.enterCodeScreen:
        return _navigateEnterCodeScreen();
      case AppString.enterNewPassword:
        return _navigateEnterNewPasswordScreen();
    }
  }
}

// {1- Login Screen}
MaterialPageRoute _navigateLoginScreen(){
  return MaterialPageRoute(
    builder: (BuildContext context) => const LoginScreen_(),
  );
}
// {2- register Screen}
MaterialPageRoute _navigateRegisterScreen(){
  return  MaterialPageRoute(
    builder: (BuildContext context) => const RegisterScreen_(),
  );
}
// {3- app layout Screen}
MaterialPageRoute _navigateAppLayoutScreen(){
  return MaterialPageRoute(
    builder: (BuildContext context) {
      print('{}{}{}{}{} checkInternet()........');
      return BlocProvider(
        create: (BuildContext context) => AppCubit()..checkInternet(),
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            if(state is InternetDisconnectedState){
              return const DisconnectedScreen(tryAgainScreen: AppString.appLayout,);
            }
            else{
              return const AppLayout();
            }
          },
        ),
      );
    },
  );
}
// {4- Categories Screen}
MaterialPageRoute _navigateCategoriesScreen(){
  return MaterialPageRoute(
    builder: (BuildContext context) => CategoriesScreen(),
  );
}
// {5- add ads Screen}
MaterialPageRoute _navigateAddAdsScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) => BlocProvider(
      create: (BuildContext context) => AddAdsCubit(),
      child: const AddAdsScreen(),
    ),
  );
}

// {6- Disconnected Screen}
MaterialPageRoute _navigateDisconnectedScreen(){
  return MaterialPageRoute(
    builder: (context) => const DisconnectedScreen(tryAgainScreen: AppString.appLayout,),
  );
}
// {7- Splash Screen}
MaterialPageRoute _navigateSplashScreen(){
  return MaterialPageRoute(
    builder: (context) => const SplashScreen(),
  );
}

// {8- BankAccount Screen}
MaterialPageRoute _navigateBankAccountScreen(){
  return MaterialPageRoute(
    builder: (context) => const BankAccountScreen(),
  );
}


// {9- ForgetPassword Screen}
MaterialPageRoute _navigateForgetPasswordScreen(){
  return MaterialPageRoute(
    builder: (context) => const ForgetPasswordScreen(),
  );
}

// {8- ForgetPassword Screen}
MaterialPageRoute _navigateEnterPhoneScreen(){
  return MaterialPageRoute(
    builder: (context) => const EnterPhoneScreen(),
  );
}

// {8- ForgetPassword Screen}
MaterialPageRoute _navigateEnterCodeScreen(){
  return MaterialPageRoute(
    builder: (context) => const EnterCodeScreen(),
  );
}

// {8- ForgetPassword Screen}
MaterialPageRoute _navigateEnterNewPasswordScreen(){
  return MaterialPageRoute(
    builder: (context) => const EnterNewPasswordScreen(),
  );
}
