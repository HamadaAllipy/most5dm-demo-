import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';

class DefaultTextForm extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscure;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final IconData? prefixIcon;
  final String text;
  final Widget? suffixIcon;
  final double borderRadius;
  final TextInputAction? textInputActionIos;
  final TextAlignVertical textAlignVertical;
  final int maxLines;

  const DefaultTextForm({
    Key? key,
    required this.controller,
    required this.text,
    this.onChanged,
    this.obscure = false,
    this.textInputActionIos,
    this.textAlignVertical = TextAlignVertical.top,
    this.borderRadius = 12,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.textInputType = TextInputType.none,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? androidTextField(context)
        : Container(
            height: context.height * 0.06,
            child: iosTextField(context),
          );
  }

  Widget androidTextField(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscure,
      validator: validator,
      maxLines: 1,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: AppColor.defaultGrey,
                size: 24,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: context.height * 0.01,
          horizontal: context.width * 0.037,
        ),
        suffixIcon: suffixIcon,
        labelText: text,
        labelStyle: TextStyle(
            color: AppColor.defaultGrey,
            fontSize: 20,
            fontWeight: FontWeight.w100),
        floatingLabelStyle: TextStyle(color: AppColor.defaultColor),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
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

  Widget iosTextField(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      textInputAction: textInputActionIos,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.037, vertical: context.height * 0.01),
      keyboardType: textInputType,
      placeholder: text,
      placeholderStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: AppColor.dimGrey,
          ),
      textAlignVertical: textAlignVertical,
      decoration: BoxDecoration(
        color: CupertinoColors.extraLightBackgroundGray,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: AppColor.secondColor,
          width: 1,
        ),
      ),
      prefix: prefixIcon != null
          ? Row(
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
            )
          : null,
      suffix: suffixIcon,
      onChanged: onChanged,
      cursorColor: CupertinoColors.activeGreen,
      obscureText: obscure,
      obscuringCharacter: '*',
      maxLines: maxLines,
    );
  }
}
