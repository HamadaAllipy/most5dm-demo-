import 'dart:async';

import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_input_code.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_logo.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        const BuildLogo(),
        SizedBox(
          height: height * 0.018,
        ),
        Text(
          'استرجاع كلمه المرور',
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: height * 0.12,
        ),
        SizedBox(
          width: double.infinity,
          child: Form(
            key: formKey,
            child: PinCodeTextField(
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 4,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {},
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: height * 0.07,
                fieldWidth: width * 0.168,
                activeColor: AppColor.defaultColor,
                borderWidth: 1,
                inactiveColor: AppColor.secondColor,
                selectedColor: AppColor.defaultColor,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                activeFillColor: Colors.white,
              ),
              cursorColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              // errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {},
              onChanged: (value) {
                print(value);
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
            ),
          ),
        ),
        SizedBox(
          height: height * 0.06,
        ),
        DefaultButton(
          onPressed: () {},
          child: Text(
            'تأكيد',
            style: Theme.of(context).textTheme.button,
          ),
        ),
        SizedBox(
          height: height * 0.038,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'ارسال الكود مرة أخري',
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
          ),
        ),
      ],
    );
  }
}
