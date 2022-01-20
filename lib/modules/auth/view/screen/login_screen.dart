import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:most5dm/components/toast.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/constants/app_padding.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/constants/custom_icon_icons.dart';
import 'package:most5dm/modules/auth/view/widgets/build_logo.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_button.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_fromfield.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_cubit.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_states.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool changeValue = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              const BuildLogo(),
              Text(
                getLang(context, 'for_sell_all') ?? 'null',
                style: Theme
                    .of(context)
                    .textTheme
                    .overline,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<AuthCubit, AuthStates>(
                builder: (context, state) {
                  var cubit = AuthCubit.get(context);
                  return DefaultTextForm(
                    textEditingController: phoneController,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone,
                    formFieldValidator: _validation,
                    label: getLang(context, 'phone_number') ?? 'null',
                    onChanged: (value) {
                      AuthCubit.get(context).validation(value.toString());
                    },
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 20,
                    ),
                    suffixIcon: cubit.empty
                        ? null
                        : cubit.valid
                            ? _buildValidIcon()
                            : _buildNotValidIcon(),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<AuthCubit, AuthStates>(
                builder: (context, state) {
                  var cubit = AuthCubit.get(context);
                  return DefaultTextForm(
                    label: getLang(context, 'password') ?? 'null',
                    textEditingController: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscure: cubit.isHide,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      onPressed: () {
                        cubit.toggleObscure();
                      },
                      icon: Icon(
                        cubit.isHide
                            ? Icons.remove_red_eye
                            : CustomIcon.eye_off,
                        color: AppColor.defaultColor,
                      ),
                    ),
                    formFieldValidator: _validation,
                  );
                },
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      getLang(context, 'forget_password') ?? 'null',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColor.defaultColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthCubit, AuthStates>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    NavigatorComponents.navigateToAndFinish(
                        context: context, routeName: AppString.appLayout);
                  } else if (state is LoginErrorState) {
                    Fluttertoast.showToast(
                      msg: state.error.toString(),
                      toastLength: Toast.LENGTH_LONG,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingLoginState) {
                    return const CircularProgressIndicator();
                  }
                  return DefaultButton(
                    text: getLang(context, 'login') ?? 'null',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (phoneController.text.length == 10 &&
                            phoneController.text.startsWith('05')) {
                          AuthCubit.get(context).loginWithPhoneNumber(
                            phoneNumber: phoneController.text,
                            password: passwordController.text,
                          );
                        } else if (!phoneController.text.startsWith('05')) {
                          showToast('يجب ان يكون الرقم الهاتف يبدء ب 05');
                        } else if (phoneController.text.length != 10) {
                          showToast(
                              'يجب ان يكون الرقم الهاتف مكون من ١٠ ارقام ');
                        }
                      }
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextButton(
                  text: getLang(context, 'have_Account') ?? 'null',
                  textButton: getLang(context, 'register_now') ?? 'null',
                  onPressed: () {
                    Navigator.pushNamed(context, AppString.registerScreen);
                  }),
              DefaultTextButton(
                text: getLang(context, 'by_logging') ?? 'null',
                textButton: getLang(context, 'terms_of_use') ?? 'null',
                onPressed: () {},
              ),
            ]),
          ),
        ),
      ),
    );
  }

  String? _validation(value) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return getLang(context, 'required');
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  Widget _buildValidIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 19,
          height: 19,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.defaultColors,
          ),
          child: const Icon(
            Icons.done,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }

  Widget _buildNotValidIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 19,
          height: 19,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: const Icon(
            Icons.clear,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}







