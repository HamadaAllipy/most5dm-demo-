import 'package:flutter/material.dart';

void navigateTo({
  required BuildContext context,
  required Widget widget,
})=> Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));

void navigateToAndFinish({
  required BuildContext context,
  required String routeName,
}){
  Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
}