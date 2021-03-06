import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_values.dart';

class BuildLogo extends StatelessWidget {
  const BuildLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/most5dm.png',
      height: 200.0,
      width: 180,
      fit: BoxFit.cover,
    );
  }
}
