import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/constants/custom_icon_icons.dart';
import 'package:most5dm/constants/done_icon_icons.dart';
import 'package:most5dm/layout/views/app_layout.dart';
import 'package:most5dm/modules/auth/view/widgets/build_icon_not_valid.dart';
import 'package:most5dm/modules/auth/view/widgets/build_icon_valid.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_cubit.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_states.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _systemLang;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _systemLang = ui.window.locale.languageCode;
    print('LANGUAGE $_systemLang');
  }
  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomStatusBar(
        child: BackgroundImage(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              top: context.height * 0.017,
              start: context.width * 0.07,
              end: context.width * 0.079,
            ),
            child: SingleChildScrollView(
              reverse: false,
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  SvgPicture.asset(
                    'assets/images/login_image.svg',
                    width: context.width * 0.59,
                    height: context.height * 0.27,
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Text(
                    getLang(context, 'login'),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  _buildPhoneNumberField(),
                  SizedBox(
                    height: context.height * 0.019,
                  ),
                  BlocBuilder<AuthCubit, AuthStates>(
                    builder: (context, state) {
                      var cubit = AuthCubit.get(context);
                      return DefaultTextForm(
                        textInputActionIos: TextInputAction.done,
                        controller: _passwordController,
                        textInputType: TextInputType.visiblePassword,
                        obscure: cubit.isHide,
                        validator: validationText,
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
                    height: context.height * 0.005,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: SizedBox(
                      height: context.height * 0.03,
                      child: TextButton(
                        onPressed: () {
                          navigateTo(context: context, routeName: AppString.enterPhoneScreen);
                        },
                        style: Theme.of(context).textButtonTheme.style,
                        child: Text(
                          getLang(context, 'forget_password'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.064,
                  ),
                  BlocConsumer<AuthCubit, AuthStates>(
                      listener: (context, state){
                        if(state is LoginSuccessState){
                          AuthCubit.get(context).validationIcon(
                            '',
                          );
                          _phoneController.clear();
                          _passwordController.clear();
                          navigateTo(context: context, routeName: AppString.appLayout);
                        }
                        else if(state is LoginErrorState){
                          showToast(state.error.toString());
                        }
                      },
                      builder: (context, state) {
                        var cubit = AuthCubit.get(context);
                        if(state is LoadingLoginState){
                          if(Platform.isIOS){
                            return const CupertinoActivityIndicator();
                          }
                          return const CircularProgressIndicator();
                        }
                        return DefaultButton(
                          onPressed: () {
                            if(Platform.isIOS){
                              _validationIos(cubit);
                            }
                            else if(Platform.isAndroid){
                              _validationAndroid(cubit);
                            }
                          },
                          child: Text(
                            getLang(context, 'login'),
                            style: Theme.of(context).textTheme.button,
                          ),
                        );
                      }
                  ),
                  SizedBox(
                    height: context.height * 0.039,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        getLang(context, 'have_Account'),
                        style: Theme.of(context).textTheme.headline6,
                        textScaleFactor: context.codeLang =='ar' ?1:0.7,
                        softWrap: true,
                      ),
                      TextButton(
                        onPressed: () {
                          AuthCubit.get(context).validationIcon(
                            '',
                          );
                          _phoneController.clear();
                          _passwordController.clear();
                          navigateTo(
                            context: context,
                            routeName: AppString.registerScreen,
                          );
                        },
                        child: Text(
                          getLang(context, 'register_now'),
                          style: Theme.of(context).textTheme.button!.copyWith(
                            color: AppColor.defaultColor,
                          ),
                          textScaleFactor: context.codeLang =='ar' ?1:0.7,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height * 0.001,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getLang(context, 'by_logging'),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF434343),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            textStyle: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(
                              fontSize: 12,
                            )),
                        child: Text(
                          getLang(context, 'terms_of_use'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildPhoneNumberField(){
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return DefaultTextForm(
          controller: _phoneController,
          textInputType: TextInputType.phone,
          textInputActionIos: TextInputAction.continueAction,
          text: getLang(context, 'phone_number'),
          prefixIcon: Icons.phone,
          validator: validationText,
          onChanged: (value) {
            AuthCubit.get(context).validationIcon(
              value.toString(),
            );
          },
          suffixIcon: cubit.empty
              ? null
              : cubit.valid
              ? const BuildIconValid()
              : const BuildIconNotValid(),
        );
      },
    );
  }

  void _validationIos(AuthCubit cubit){
    // not valid
    if(_phoneController.text.isEmpty ){
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('Phone Field is Empty'),
          actions: <Widget>[
            CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('ok'))
          ],
        ),
      );
    }
    else if(_passwordController.text.isEmpty){
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('password Field is Empty'),
          actions: <Widget>[
            CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('ok'))
          ],
        ),
      );
    }
    // valid
    else{
      cubit.loginWithPhoneNumber(phoneNumber: _phoneController.text, password: _passwordController.text);
    }
  }
  void _validationAndroid(AuthCubit cubit){
    if(formKey.currentState!.validate()){
      cubit.loginWithPhoneNumber(phoneNumber: _phoneController.text, password: _passwordController.text);
    }
  }

  String? validationText( value) {
    if (value.isNotEmpty) {
      return null;
    } else {
      return getLang(context, 'required');
    }
  }
}
