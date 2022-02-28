import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

void DebugPrint(String error){
  if(kDebugMode){
    print('Error $error');
  }
}

String formatPrice(int price){
  NumberFormat numberFormat = NumberFormat('###,###');
  return numberFormat.format(price);
}