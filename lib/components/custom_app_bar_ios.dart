import 'package:flutter/cupertino.dart';
import 'package:most5dm/constants/app_colors.dart';

class CustomAppBarIos extends StatelessWidget {
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;

  const CustomAppBarIos({
    Key? key,
    this.leading,
    this.middle,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: AppColor.secondColor,
      leading: leading,
      middle: middle,
      trailing: trailing,
    );
  }
}
