import 'package:flutter/material.dart' show Color, Colors, MaterialColor;
import 'package:flutter/services.dart';

class AppColor{

  AppColor._() {
    // TODO: implement _
    throw UnimplementedError();
  }
  static Color defaultColor = const Color(0xFF4EB77C);
  static Color defaultColorDark = const Color(0xFF31891B);
  static Color secondColor = const Color(0xFF1D4D4F);
  static Color defaultGrey = const Color(0xFFA1A1A1);
  static Color defaultColors = const MaterialColor(
    0xff2BC27F,
    {50: Color(0xFFFFEBEE)},
  );
}

void changeStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
        statusBarColor: AppColor.secondColor, //
        statusBarIconBrightness: Brightness.light// status bar color
    ),
  );
}