import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg){
  Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG , timeInSecForIosWeb: 3);
}