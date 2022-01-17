import 'package:connectivity/connectivity.dart';

Future<bool> checkInternet()async{
  ConnectivityResult result = await Connectivity().checkConnectivity();
  if(result == ConnectivityResult.none){
    return false;
  }
  else {
    return true;
  }
}