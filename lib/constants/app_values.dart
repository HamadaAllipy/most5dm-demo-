import 'package:flutter/material.dart';

const double defaultHeightButton = 55.0;
const double defaultFontSize = 16.0;
const double minFontSize = 14.0;
const double maxFontSize = 22.0;
const double heightLogoMost5dm = 200.0;
const double widthLogoMost5dm = 180.0;



extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
