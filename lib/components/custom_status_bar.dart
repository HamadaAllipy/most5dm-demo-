import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomStatusBar extends StatelessWidget {
  final Color? statusBar;
  final Widget child;
  final SystemUiOverlayStyle brightness;

   const CustomStatusBar({
    Key? key,
    required this.child,
     this.statusBar =  const Color(0xFF1D4D4F),
     this.brightness = SystemUiOverlayStyle.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: brightness,
        child: Column(
          children: [
            if(Platform.isAndroid)
            Container(
              height: MediaQuery.of(context).padding.top,
              color: statusBar,
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
