import 'package:flutter/material.dart';

class NavigatorComponents{
  NavigatorComponents._();
  static void navigateTo({
    required BuildContext context,
    required String routeName,
  })=> Navigator.pushNamed(context, routeName);

  static void navigateToAndFinish({
    required BuildContext context,
    required String routeName,
  }){
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}



