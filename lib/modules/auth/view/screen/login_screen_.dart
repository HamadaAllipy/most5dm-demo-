import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/custom_icon_icons.dart';
import 'package:most5dm/constants/done_icon_icons.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_cubit.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_states.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class LoginScreen_ extends StatefulWidget {
  const LoginScreen_({Key? key}) : super(key: key);

  @override
  State<LoginScreen_> createState() => _LoginScreen_State();
}

class _LoginScreen_State extends State<LoginScreen_> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Form(
        key: formKey,
        child: CustomStatusBar(
          child: BackgroundImage(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: height * 0.017,
                start: width * 0.07,
                end: width * 0.079,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    SvgPicture.asset(
                      'assets/images/login_image.svg',
                      width: width * 0.59,
                      height: height * 0.27,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      'تسجيل دخول',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        var cubit = AuthCubit.get(context);
                        return DefaultTextForm(
                          controller: _phoneController,
                          height: height,
                          keyboardType: TextInputType.phone,
                          text: getLang(context, 'phone_number'),
                          prefixIcon: Icons.phone,
                          width: width,
                          onChanged: (value) {
                            AuthCubit.get(context).validation(
                              value.toString(),
                            );
                          },
                          suffixIcon: cubit.empty
                              ? null
                              : cubit.valid
                                  ? _buildValidIcon()
                                  : _buildNotValidIcon(),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.019,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        var cubit = AuthCubit.get(context);
                        return DefaultTextForm(
                          height: height,
                          width: width,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscure: cubit.isHide,
                          validator: _validation,
                          text: getLang(context, 'password'),
                          prefixIcon: Icons.lock,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.toggleObscure();
                            },
                            icon: Icon(
                              cubit.isHide
                                  ? Icons.remove_red_eye
                                  : CustomIcon.eye_off,
                              color: AppColor.defaultGrey,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: SizedBox(
                        height: height * 0.03,
                        child: TextButton(
                          onPressed: () {},
                          style: Theme.of(context).textButtonTheme.style,
                          child: Text(
                            getLang(context, 'forget_password'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.064,
                    ),
                    DefaultButton_(
                      onPressed: () {},
                      child: Text(
                        getLang(context, 'login'),
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.039,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          getLang(context, 'have_Account'),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextButton(
                          onPressed: () {
                            NavigatorComponents.navigateTo(
                              context: context,
                              routeName: AppString.registerScreen,
                            );
                          },
                          child: Text(
                            getLang(context, 'register_now'),
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: AppColor.defaultColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.001,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getLang(context, 'by_logging'),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF434343),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: Theme.of(context).textButtonTheme.style,
                          child: Text(
                              getLang(
                                context,
                                'terms_of_use',
                              ),
                              style:
                                  Theme.of(context).textTheme.button!.copyWith(
                                        color: AppColor.defaultColor,
                                        fontSize: 15,
                                      )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildValidIcon() {
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

  String? _validation(value) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return getLang(context, 'required');
    }
  }
}
