import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class BuildInputCode extends StatefulWidget {
  final TextEditingController codeController;

  const BuildInputCode({
    Key? key,
    required this.codeController,
  }) : super(key: key);

  @override
  State<BuildInputCode> createState() => _BuildInputCodeState();
}

class _BuildInputCodeState extends State<BuildInputCode> {

  TextEditingController codeController = TextEditingController();
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.blue.shade50,
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: codeController,
      onCompleted: (v) {
        print('Completed');
      },
      onChanged: (value) {
        print(value);
        print('onChanged $value');
      },
      beforeTextPaste: (text) {
        print('Allowing to paste $text');
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      appContext: context,
    );
  }
}


/*
 Container(
      height: height * 0.07,
      width: width * 0.16,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColor.defaultColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   '8',
            //   style: Theme.of(context).textTheme.subtitle1,
            // ),
            SizedBox(
              height: height * 0.04,
              child: TextField(
                textAlign: TextAlign.center,
                controller: widget.codeController,
                maxLength: 1,
                onChanged: (value) {},
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFF707070),
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFF707070),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
 */
