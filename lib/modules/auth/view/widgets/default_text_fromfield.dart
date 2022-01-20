import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';

class DefaultTextForm extends StatelessWidget {
  final TextInputType? keyboardType;
  final String label;
  final TextEditingController? textEditingController;
  final bool obscure;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final FormFieldValidator<String>? formFieldValidator;
  final ValueChanged<String>? onChanged;
  final BoxConstraints? suffixIconConstraints;


  const DefaultTextForm({
    Key? key,
    required this.label,
    required this.textEditingController,
    this.formFieldValidator,
    this.keyboardType,
    this.obscure = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.suffixIconConstraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscure,
      controller: textEditingController,
      validator: formFieldValidator,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIconConstraints: suffixIconConstraints,
        suffixIcon: suffixIcon,
        prefixIcon: Icon(
          prefixIcon,
          color: AppColor.defaultColor,
        ),
        label: Text(
          label,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColor.defaultColor,
            )),
      ),
    );
  }
}
