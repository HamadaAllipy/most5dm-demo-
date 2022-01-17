import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.defaultColor,
      minWidth: double.infinity,
      height: 50,
      child: Text(
        text,
        style: Theme.of(context).textTheme.button!.copyWith(fontSize: 18),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
