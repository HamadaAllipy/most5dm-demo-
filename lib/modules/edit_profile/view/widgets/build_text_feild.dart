import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/constants/app_values.dart';

class BuildTextField extends StatelessWidget {
  final TextEditingController controller;
  // final String initialValue;
  final String label;
  final IconData prefixIcon;
  final bool enabled;
  final bool obscure;
  final Widget? suffixIcon;

  const BuildTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.enabled = true,
    this.obscure = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      obscureText: obscure,
      controller: controller,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w100,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColor.defaultColor,
          ),
        ),
        labelText: label,
        suffixIcon: suffixIcon,
        prefixIcon: Icon(
          prefixIcon,
          color: AppColor.secondColor,
        ),
        floatingLabelStyle: TextStyle(
            color: AppColor.defaultColor, fontWeight: FontWeight.w100),
        labelStyle: TextStyle(
            color: AppColor.defaultGrey,
            fontSize: 16,
            fontWeight: FontWeight.w100),
        contentPadding:  EdgeInsets.symmetric(
          vertical: context.height * 0.0016,
          horizontal: 10,
        ),
      ),
    );
  }
}
