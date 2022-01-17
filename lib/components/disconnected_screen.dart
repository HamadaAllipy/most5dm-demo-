import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';

class DisconnectedScreen extends StatelessWidget {

  final String tryAgainScreen;
  const DisconnectedScreen({Key? key, required this.tryAgainScreen,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hSize = MediaQuery.of(context).size.height;
    var wSize = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wifi,
                  color: Colors.grey,
                  size: 100,
                ),
                SizedBox(
                  height: hSize * 0.03,
                ),
                const Text(
                  'فشل الاتصال بالانترنت',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'الرجاء التأكد من أن جهازك متصل بالانترنت والمحاولة مرة أخري',
                ),
                SizedBox(
                  height: hSize * 0.10,
                ),
                Container(
                  color: AppColor.defaultColor,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(tryAgainScreen, (route) => false);
                    },
                    child: const Text(
                      'حاول مرة أخري',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
