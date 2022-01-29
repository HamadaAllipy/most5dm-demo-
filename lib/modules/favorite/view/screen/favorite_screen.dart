import 'package:flutter/material.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: (){
          CashHelper.clearData().then((value) {
            navigateToAndFinish(context: context, routeName: AppString.loginScreen);
          }).catchError((onError){
            showToast(onError.toString());
          });
        },
        child: const Text('Sign out'),
      ),
    );
  }
}
