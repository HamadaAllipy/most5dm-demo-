import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  void initController() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
  }

  @override
  void initState() {
    initController();
    afterDelayed();
    super.initState();
  }

  void afterDelayed() {
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) => navigateToAndFinish(
        context: context,
        routeName: initialRoute(
          isLogin: CashHelper.getString(key: 'token') != null,
        ),
      ),
    ).catchError((onError){
      // TODO remove this
      print('Error: $onError');
      showToast(onError.toString());
    });
  }

  String initialRoute({required bool isLogin}) {
    if (isLogin) {
      return AppString.appLayout;
    } else {
      return AppString.loginScreen;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: BackgroundImage(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: context.height * 0.15,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/images/most5dm.png',
                  height: context.height * 0.38,
                  width: context.width * 0.89,
                ),
                const Text(
                  'Most5dm',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Roboto',
                    color: Color(0xff1D4D4F),
                  ),
                ),
                const Text(
                  'بيع وشراء كل مستعمل',
                  style: TextStyle(
                    fontSize:  23,
                    height: 0.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1D4D4F),
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// commit
/*
Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: const [
                  Text(
                    'most5dm',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22),
                  ),
                  Text(
                    '.com',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: controller.value,
              color: AppColor.defaultColor,
            ),
 */
}
