import 'package:flutter/material.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/modules/auth/view/screen/login_screen.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: (){
          CashHelper.clearData().then((value) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
            );
          }).catchError((onError){
            print(onError);
            showToast(onError.toString());
          });
        },
        child: const Text('Sign out'),
      ),
    );
  }
}
