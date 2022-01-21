import 'dart:io';

import 'package:flutter/material.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_back_icon.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_logo.dart';

class EnterNewPasswordScreen extends StatefulWidget {
  const EnterNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EnterNewPasswordScreen> createState() => _EnterNewPasswordScreenState();
}

class _EnterNewPasswordScreenState extends State<EnterNewPasswordScreen> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

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
                    'اوشكت علي الانتهاء',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: height * 0.12,
                  ),
                  DefaultTextForm(
                    controller: passwordController,
                    keyboardType: TextInputType.phone,
                    text: getLang(context, 'password'),
                    prefixIcon: Icons.phone,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  DefaultTextForm(
                    controller: rePasswordController,
                    text: getLang(context, 're_password'),
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  DefaultButton_(
                    onPressed: () {},
                    child: Text(
                      'تغيير كلمه المرور',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
