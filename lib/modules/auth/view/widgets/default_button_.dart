import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';

class DefaultButton_ extends StatelessWidget {

  final VoidCallback? onPressed;
  final Widget child;
  const DefaultButton_({Key? key, required this.onPressed, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      height: height * 0.06,
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
  }
}
