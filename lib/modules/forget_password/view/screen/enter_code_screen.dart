import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_back_icon.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_logo.dart';
import 'package:most5dm/shared/widgets/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({Key? key}) : super(key: key);

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomStatusBar(
      child: BackgroundImage(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: height * 0.018,
            start: width * 0.079,
            end: width * 0.079,
          ),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  const BuildLogo(),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  Text(
                    getLang(context, 'recovery_password'),
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
                          print('Allowing to paste $text');
                          return true;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  DefaultButton(
                    onPressed: () {
                      navigateTo(context: context, routeName: AppString.enterNewPassword);
                    },
                    child: Text(
                      getLang(context, 'confirm'),
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.038,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                        getLang(context, 'send_code_again'),
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )
                    ),
                  ),
                  SizedBox(
                    height: height * 0.177,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: height * 0.017,
                        width: width * 0.037,
                        decoration: const BoxDecoration(
                          color: Color(0xFFDCDADA),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: height * 0.017,
                        width: width * 0.037,
                        decoration: BoxDecoration(
                          color: AppColor.secondColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: height * 0.017,
                        width: width * 0.037,
                        decoration: BoxDecoration(
                          color: AppColor.secondColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if(Platform.isAndroid)
                const BuildBackIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
