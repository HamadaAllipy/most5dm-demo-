import 'package:flutter/material.dart' show Color, Colors, MaterialColor;
import 'package:flutter/services.dart';

class AppColor{

  AppColor._() {
    // TODO: implement _
    throw UnimplementedError();
  }
  static Color defaultColor = const Color(0xff2BC27F);
  static Color defaultColors = const MaterialColor(
    0xff2BC27F,
    {50: Color(0xFFFFEBEE)},
  );
}

void changeStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white, //
        statusBarIconBrightness: Brightness.dark// status bar color
    ),
  );
}