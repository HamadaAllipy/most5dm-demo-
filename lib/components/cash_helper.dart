import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{

  static late SharedPreferences _sharedPreferences;

 static initialSharedPreferences()async{
   _sharedPreferences = await SharedPreferences.getInstance();
 }

  static toCash({
    required String key,
    required dynamic value,
  }) {
    if (value is String) {
      try {
        _sharedPreferences.setString(key, value);
      } on Exception catch (e) {
        print('Error: when setString in sharedPreferences $e');
      }
    }
    else if (value is bool) {
      try {
        _sharedPreferences.setBool(key, value);
      } on Exception catch (e) {
        print('Error: when setBool in sharedPreferences $e');
      }
    }
    else if (value is int) {
      try {
        _sharedPreferences.setInt(key, value);
      } on Exception catch (e) {
        print('Error: when setInt in sharedPreferences $e');
      }
    }
    else if (value is double) {
      try {
        _sharedPreferences.setDouble(key, value);
      } on Exception catch (e) {
        print('Error: when setDouble in sharedPreferences $e');
      }
    }
  }

  static Object? fromCash({
    required String key,
}){
    return _sharedPreferences.get(key);
  }
}