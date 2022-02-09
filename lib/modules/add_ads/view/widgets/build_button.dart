import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';

class BuildButton extends StatelessWidget {

  final GestureTapCallback? onTap;
  final String text;
  const BuildButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: context.height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Platform.isIOS? CupertinoColors.extraLightBackgroundGray: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColor.dimGrey,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: context.width * 0.028,
            end: context.width * 0.037,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: AppColor.blackLight,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
