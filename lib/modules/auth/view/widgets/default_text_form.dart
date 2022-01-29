import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';

class DefaultTextForm extends StatelessWidget {

  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscure;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final IconData prefixIcon;
  final String text;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  const DefaultTextForm({
    Key? key,
    required this.controller,
    required this.text,
    this.onChanged,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? androidTextField() : iosTextField();
  }

  Widget androidTextField() {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      validator: validator,
      maxLines: 1,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: AppColor.defaultGrey,
          size: 24,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        suffixIcon: suffixIcon,
        labelText: text,
        labelStyle: TextStyle(color: AppColor.defaultGrey, fontSize: 20, fontWeight: FontWeight.w100),
        floatingLabelStyle: TextStyle(color: AppColor.defaultColor),
        fillColor: Colors.white,
        filled: true,
        // suffixIconConstraints: BoxConstraints(
        //   ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget iosTextField() {
    return CupertinoTextField(
      controller: controller,
      textInputAction: textInputAction,
      padding: const EdgeInsets.all(16.0),
      keyboardType: keyboardType,
      placeholder: text,
      placeholderStyle: TextStyle(
          color: AppColor.defaultGrey,
          fontSize: 20,
          fontWeight: FontWeight.w100),
      decoration: BoxDecoration(
        color: CupertinoColors.extraLightBackgroundGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.secondColor,
          width: 1,
        ),
      ),
      prefix: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 12,
          ),
          Icon(
            prefixIcon,
            color: AppColor.defaultGrey,
            size: 24,
          ),
        ],
      ),
      suffix: suffixIcon,
      onChanged: onChanged,
      cursorColor: CupertinoColors.activeGreen,
      obscureText: obscure,
      obscuringCharacter: '*',
      maxLines: 1,
    );
  }
}
