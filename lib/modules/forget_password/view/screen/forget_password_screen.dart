import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_back_icon.dart';
import 'package:most5dm/modules/forget_password/view/widgets/build_logo.dart';
import 'package:most5dm/modules/forget_password/view/widgets/dots_indicator.dart';
import 'package:most5dm/modules/forget_password/view/widgets/on_boarding_screens/screen_1.dart';
import 'package:most5dm/modules/forget_password/view/widgets/on_boarding_screens/screen_2.dart';
import 'package:most5dm/modules/forget_password/view/widgets/on_boarding_screens/screen_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  PageController pageController = PageController();
  List<Color> colors = [
    Colors.red,
    Colors.cyanAccent,
    Colors.purple,
    Colors.deepPurple,
  ];

  List<Widget> screens = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree()
  ];

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
            children: [
              Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: 3,
                        physics: const BouncingScrollPhysics(),
                        clipBehavior: Clip.antiAlias,
                        allowImplicitScrolling: true,
                        itemBuilder: (context, index) {
                          return screens[index];
                        }),
                  ),
                ],
              ),
               PositionedDirectional(
                end: 0,
                child: BuildBackIcon(),
              ),
              PositionedDirectional(
                bottom: height * 0.168,
                start: width * 0.5,
                end: width * 0.5,
                child: DotsIndicator(
                  count: screens.length,
                  pageController: pageController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
