import 'package:flutter/material.dart';

class BuildLogo extends StatelessWidget {
  const BuildLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Image.asset(
      'assets/images/most5dm.png',
      width: width * 0.37,
      height: height * 0.17,
      fit: BoxFit.cover,
    );
  }
}
