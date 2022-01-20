import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';

class DefaultTextForm extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscure;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final IconData prefixIcon;
  final String text;
  final Widget? suffixIcon;

  const DefaultTextForm({Key? key,

    required this.controller,
    required this.height,
    required this.text,
    this.onChanged,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.064,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscure,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: AppColor.defaultGrey,
            size: 24,
          ),
          suffixIcon: suffixIcon,
          labelText: text,
          labelStyle: TextStyle(color: AppColor.defaultGrey),
          floatingLabelStyle: TextStyle(color: AppColor.defaultColor),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: AppColor.defaultColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: AppColor.secondColor, width: 1),
          ),
        ),
      ),
    );
  }
}
