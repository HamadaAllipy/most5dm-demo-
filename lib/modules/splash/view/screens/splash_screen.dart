import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
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


  void afterDelayed(){
    Future.delayed(const Duration(milliseconds: 1500)).then(
          (value) => navigateToAndFinish(
        context: context,
        routeName: initialRoute(isLogin: false),
      ),
    );
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 200,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/most5dm.png'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
