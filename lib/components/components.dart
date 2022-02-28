import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg,{ Toast duration =  Toast.LENGTH_LONG}){
  Fluttertoast.showToast(msg: msg, toastLength: duration, timeInSecForIosWeb: 3);
}

