import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:most5dm/constants/app_locale.dart';

/// high level function

Locale? localeResolutionCallback(currentLang, supportLang) {
  if (currentLang != null) {
    for (Locale locale in supportLang) {
      if (locale.languageCode == currentLang.languageCode) {
        return currentLang;
      }
    }
  } else {
    return supportLang.first;
  }
}

/// high level variable
const Iterable<Locale> supportedLocales = [
  Locale('ar', ''),
  Locale('en', ''),
];


const Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates = [
  AppLocale.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];