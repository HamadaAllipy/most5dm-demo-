import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/layout/views/app_layout.dart';
import 'package:most5dm/modules/account/view/screens/view_profile_screen.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/auth/view/screen/login_screen.dart';
import 'package:most5dm/modules/auth/view/screen/register_screen.dart';
import 'package:most5dm/modules/forget_password/view/screen/enter_code_screen.dart';
import 'package:most5dm/modules/forget_password/view/screen/enter_new_password_screen.dart';
import 'package:most5dm/modules/forget_password/view/screen/enter_phone_screen.dart';
import 'package:most5dm/modules/splash/view/screens/splash_screen.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/add_ads/view/screen/add_ads_screen.dart';
import 'package:most5dm/components/disconnected_screen.dart';

import 'app_string.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings router) {
    switch (router.name) {
    /// go to AUTH MODULE
      case AppString.loginScreen:
        return _navigateLoginScreen();
      case AppString.registerScreen:
        return _navigateRegisterScreen();
      /// go to APP LAYOUT MODULE
      case AppString.appLayout:
        return _navigateAppLayoutScreen();
      case AppString.addAdsScreen:
        return _navigateAddAdsScreen();
      /// go to OFFLINE MODULE
      case AppString.disconnectedScreen:
        return _navigateDisconnectedScreen();
    /// go to INTRO APP
      case AppString.splashScreen:
        return _navigateSplashScreen();
    /// go to FORGET PASSWORD MODULE
      case AppString.enterPhoneScreen:
        return _navigateEnterPhoneScreen();
      case AppString.enterCodeScreen:
        return _navigateEnterCodeScreen();
      case AppString.enterNewPassword:
        return _navigateEnterNewPasswordScreen();

      case AppString.viewProfileScreen:
        return _navigateViewProfileScreen();

    }
  }
}

/// INTRO APP MODULE
// Splash Screen
MaterialPageRoute _navigateSplashScreen(){
  return MaterialPageRoute(
    builder: (context) => const SplashScreen(),
  );
}

/// AUTH MODULE
// Login Screen
MaterialPageRoute _navigateLoginScreen(){
  print('_navigateLoginScreen');
  return MaterialPageRoute(
    builder: (BuildContext context) => const LoginScreen(),
  );
}
//  register Screen
MaterialPageRoute _navigateRegisterScreen(){
  return  MaterialPageRoute(
    builder: (BuildContext context) => const RegisterScreen(),
  );
}

/// LAYOUT MODULE
// app layout Screen
MaterialPageRoute _navigateAppLayoutScreen()=> MaterialPageRoute(
    builder: (BuildContext context) {
      return AppLayout();
    },
  );
// Categories Screen
// add ads Screen
MaterialPageRoute _navigateAddAdsScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) => BlocProvider(
      create: (BuildContext context) => AddAdsCubit(),
      child: const AddAdsScreen(),
    ),
  );
}

/// FORGET PASSWORD MODULE
// enter phone screen
MaterialPageRoute _navigateEnterPhoneScreen(){
  return MaterialPageRoute(
    builder: (context) => const EnterPhoneScreen(),
  );
}

// enter code screen
MaterialPageRoute _navigateEnterCodeScreen(){
  return MaterialPageRoute(
    builder: (context) => const EnterCodeScreen(),
  );
}

//  enter new password screen
MaterialPageRoute _navigateEnterNewPasswordScreen(){
  return MaterialPageRoute(
    builder: (context) => const EnterNewPasswordScreen(),
  );
}

/// PROFILE MODULE
// view profile screen
MaterialPageRoute _navigateViewProfileScreen() {
  return MaterialPageRoute(
    builder: (context) => const ViewProfileScreen(),
  );
}

/// OFFLINE MODULE
// {1- Disconnected Screen}
MaterialPageRoute _navigateDisconnectedScreen(){
  return MaterialPageRoute(
    builder: (context) => const DisconnectedScreen(),
  );
}
