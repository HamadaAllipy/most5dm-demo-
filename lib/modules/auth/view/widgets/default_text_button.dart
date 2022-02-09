import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final String textButton;
  final VoidCallback onPressed;

  const DefaultTextButton({
    Key? key,
    required this.text,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsetsDirectional.all(3),
          ),
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 16,
              color: AppColor.defaultColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
