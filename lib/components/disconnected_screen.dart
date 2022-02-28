import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class DisconnectedScreen extends StatelessWidget {

  const DisconnectedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(
              context.height * 0.026,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/no_connection.svg',
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: context.width * 0.21,
                  ),
                  width: double.infinity,
                  height: context.height * 0.06,
                  decoration: BoxDecoration(
                      color: AppColor.defaultColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextButton(
                    onPressed: () {
                      AppCubit.get(context).checkInternet();
                    },
                    child: Text(
                      'حاول مرة أخري',
                      style: Theme.of(context).textTheme.button,
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
