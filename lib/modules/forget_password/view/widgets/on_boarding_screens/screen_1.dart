import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_logo.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  TextEditingController phoneController = TextEditingController();
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
        DefaultTextForm(
          controller: phoneController,
          height: height,
          keyboardType: TextInputType.phone,
          text: getLang(context, 'phone_number'),
          prefixIcon: Icons.phone,
          width: width,
          onChanged: (value) {},
        ),
        SizedBox(
          height: height * 0.06,
        ),
        DefaultButton_(
          onPressed: () {},
          child: Text(
            'ارسال الكود',
            style: Theme.of(context).textTheme.button,
          ),
        ),

      ],
    );
  }
}
