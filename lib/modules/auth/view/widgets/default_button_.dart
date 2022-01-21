import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';

class DefaultButton_ extends StatelessWidget {

  final VoidCallback? onPressed;
  final Widget child;
  const DefaultButton_({Key? key, required this.onPressed, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? androidButton(context) : iosButton();
  }

  Widget androidButton(BuildContext context)=> MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      height: context.height * 0.06,
      color: AppColor.defaultColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColor.secondColor,
          width: 1,
        ),
      ),
      child: child,
    );
  Widget iosButton(){
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        color: AppColor.defaultColor,
        child: child,
        borderRadius: BorderRadius.circular(12),
        onPressed: onPressed,
      ),
    );
  }
}
