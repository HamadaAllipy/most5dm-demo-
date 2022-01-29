import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;

  const CustomAppBar({
    Key? key,
    required this.child,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0,1),
            blurRadius: 20,

          ),
        ],
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
