import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:most5dm/constants/app_locale.dart';

showToast(String msg){
  Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG , timeInSecForIosWeb: 3);
}

