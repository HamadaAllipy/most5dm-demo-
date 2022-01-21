import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_logo.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
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
          'اوشكت علي الانتهاء',
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: height * 0.12,
        ),
        DefaultTextForm(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          text: getLang(context, 'phone_number'),
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
      ],
    );
  }
}
