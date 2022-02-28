import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';

class CustomAppBarAdaptive extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomAppBarAdaptive({Key? key, required this.scaffoldKey}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid? _buildAppBarHomeAndroid(context): _buildAppBarHomeIOS(context);
  }

  Widget _buildAppBarHomeAndroid(BuildContext context){
    return Container(
      height: kToolbarHeight,
      child: Row(
        children: [
          IconButton(
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
            icon: Icon(
              Icons.menu,
              size: 30,
              color: AppColor.defaultColor,
            ),
          ),
          Image.asset(
            'assets/images/most5dm.png',
            height: context.height * 0.04,
            width: context.width * 0.086,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Most',
                  style: TextStyle(
                    color: AppColor.secondColor,
                    fontSize: context.height * 0.027,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '5',
                  style: TextStyle(
                    color: AppColor.defaultColor,
                    fontSize: context.height * 0.027,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'dm',
                  style: TextStyle(
                    color: AppColor.secondColor,
                    fontSize: context.height * 0.027,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.width * 0.02,
          ),
          AutoSizeText(
            'بيع وشراء كل مستعمل',
            style: TextStyle(
              color: AppColor.secondColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            minFontSize: 18,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
  Widget _buildAppBarHomeIOS(BuildContext context){
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.white,
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: (){
          scaffoldKey.currentState!.openDrawer();
        },
        child: Icon(
          Icons.menu,
          size: 28,
          color: AppColor.defaultColor,
        ),
      ),
      middle: Row(
        children: [
          Image.asset(
            'assets/images/most5dm.png',
            height: context.height * 0.04,
            width: context.width * 0.086,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Most',
                  style: TextStyle(
                    color: AppColor.secondColor,
                    fontSize: context.height * 0.027,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '5',
                  style: TextStyle(
                    color: AppColor.defaultColor,
                    fontSize: context.height * 0.027,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'dm',
                  style: TextStyle(
                    color: AppColor.secondColor,
                    fontSize: context.height * 0.027,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.width * 0.02,
          ),
          AutoSizeText(
            'بيع وشراء كل مستعمل',
            style: TextStyle(
              color: AppColor.secondColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            minFontSize: 18,
            maxLines: 1,
          ),
        ],
      ),
      // middle: middle,
      // trailing: trailing,
    );
  }
}
