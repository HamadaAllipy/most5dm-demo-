import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_locale.dart';


extension MediaQueryValues on BuildContext  {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  String get codeLang => AppLocale.of(this).locale.languageCode;
}

extension Localization on AppLocale{
}

