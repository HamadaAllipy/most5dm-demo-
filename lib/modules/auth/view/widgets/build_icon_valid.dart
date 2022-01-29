import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/done_icon_icons.dart';

class BuildIconValid extends StatelessWidget {
  const BuildIconValid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          DoneIcon.ok,
          color: AppColor.defaultColor,
          size: 23,
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
