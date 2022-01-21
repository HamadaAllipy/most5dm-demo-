import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/custom_icon_icons.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';

class RegisterScreen_ extends StatefulWidget {
  const RegisterScreen_({Key? key}) : super(key: key);

  @override
  State<RegisterScreen_> createState() => _RegisterScreen_State();
}

class _RegisterScreen_State extends State<RegisterScreen_> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomStatusBar(
      child: BackgroundImage(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.079),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height * 0.016,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getLang(context, 'register'),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      width: width * 0.09,
                    ),
                    Image.asset(
                      'assets/images/most5dm.png',
                      width: width * 0.257,
                      height: height * 0.118,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                DefaultTextForm(
                  controller: userNameController,
                  height: height,
                  text: getLang(context, 'userName'),
                  prefixIcon: CustomIcon.person,
                  width: width,
                ),
                SizedBox(
                  height: height * 0.017,
                ),
                DefaultTextForm(
                  controller: phoneNumberController,
                  height: height,
                  text: getLang(context, 'phone_number'),
                  prefixIcon: Icons.phone,
                  width: width,
                ),
                SizedBox(
                  height: height * 0.017,
                ),
                DefaultTextForm(
                  controller: emailController,
                  height: height,
                  text: getLang(context, 'email'),
                  prefixIcon: Icons.email,
                  width: width,
                ),
                SizedBox(
                  height: height * 0.017,
                ),
                DefaultTextForm(
                  controller: passwordController,
                  height: height,
                  text: getLang(context, 'password'),
                  prefixIcon: Icons.lock,
                  width: width,
                ),
                SizedBox(
                  height: height * 0.017,
                ),
                DefaultTextForm(
                  controller: rePasswordController,
                  height: height,
                  text: getLang(context, 're_password'),
                  prefixIcon: Icons.lock,
                  width: width,
                ),
                SizedBox(
                  height: height * 0.017,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.02,
                    ),
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: Checkbox(
                        value: true,
                        activeColor: AppColor.defaultGrey,
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      getLang(context, 'terms_of_use'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                DefaultButton_(
                  onPressed: () {},
                  child: Text(
                    getLang(context, 'login'),
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      getLang(context, 'already_have_ac'),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        getLang(
                          context,
                          'login',
                        ),
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: AppColor.defaultColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
