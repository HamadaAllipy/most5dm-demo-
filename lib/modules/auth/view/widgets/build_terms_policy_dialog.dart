import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/read_json.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_cubit.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_states.dart';

import '../../../../constants/app_string.dart';

class BuildTermsPolicyDialog extends StatelessWidget {
  const BuildTermsPolicyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {

        final cubit = AuthCubit.get(context);
        return AlertDialog(
          contentPadding: EdgeInsetsDirectional.only(
            end: 7,
          ),
          title: Text(
            'Term & Condition',
            textDirection: TextDirection.ltr,
          ),
          content: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppString.terms_of_condition,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: context.width,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.start,
          actions: [
            ElevatedButton(
              onPressed: () {
                cubit.toggleCheckBox(true);
                Navigator.pop(context);
              },
              child: Text(
                'AGREE',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {
                cubit.toggleCheckBox(false);
                Navigator.pop(context);
              },
              child: Text(
                'DISAGREE',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
