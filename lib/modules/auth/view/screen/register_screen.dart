import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/constants/custom_icon_icons.dart';
import 'package:most5dm/modules/auth/view/widgets/build_icon_not_valid.dart';
import 'package:most5dm/modules/auth/view/widgets/build_icon_valid.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_cubit.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_states.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late TextEditingController _userNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late GlobalKey<FormState> _formKey;


  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _userNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
          return CustomStatusBar(
            child: BackgroundImage(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.width * 0.079),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: context.height * 0.016,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(constraints.maxWidth < 392)
                              Text(
                              getLang(context, 'register'),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            if(constraints.maxWidth > 392)
                              Text(
                                getLang(context, 'register'),
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            SizedBox(
                              width: context.width * 0.09,
                            ),
                            Image.asset(
                              'assets/images/most5dm.png',
                              width: context.width * 0.257,
                              height: context.height * 0.118,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.height * 0.10,
                        ),
                        DefaultTextForm(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          controller: _userNameController,
                          validator: validationText,
                          text: getLang(context, 'userName'),
                          prefixIcon: CustomIcon.person,
                        ),
                        SizedBox(
                          height: context.height * 0.017,
                        ),
                        BlocBuilder<AuthCubit, AuthStates>(
                          builder: (context, state) {
                            var cubit = AuthCubit.get(context);
                            return DefaultTextForm(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
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
                        ),
                        SizedBox(
                          height: context.height * 0.017,
                        ),
                        DefaultTextForm(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: _emailController,
                          text: getLang(context, 'email'),
                          validator: validationText,
                          prefixIcon: Icons.email,
                        ),
                        SizedBox(
                          height: context.height * 0.017,
                        ),
                        BlocBuilder<AuthCubit, AuthStates>(builder: (context, state) {
                          var cubit = AuthCubit.get(context);
                          return DefaultTextForm(
                            textInputAction: TextInputAction.done,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
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
                        }),
                        SizedBox(
                          height: context.height * 0.017,
                        ),
                        BlocBuilder<AuthCubit, AuthStates>(builder: (context, state) {
                          var cubit = AuthCubit.get(context);
                          return DefaultTextForm(
                            textInputAction: TextInputAction.done,
                            controller: _confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscure: cubit.isHide,
                            validator: validationText,
                            text: getLang(context, 'confirm_password'),
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
                        }),
                        SizedBox(
                          height: context.height * 0.017,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: context.width * 0.02,
                            ),
                            SizedBox(
                              width: 18,
                              height: 18,
                              child: BlocBuilder<AuthCubit , AuthStates>(
                                builder: (context, state) {
                                  var cubit = AuthCubit.get(context);
                                  return Checkbox(
                                    value: cubit.isChecked,
                                    activeColor: AppColor.defaultGrey,
                                    onChanged: (value) {
                                      cubit.toggleCheckBox(value as bool);
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            if(Platform.isIOS)
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  getLang(context, 'terms_of_use'),
                                  style: const TextStyle(
                                    color: Color(0xFF4B4B4B),
                                    fontSize: 15,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            if(Platform.isAndroid)
                              TextButton(onPressed: (){}, child: Text(
                                getLang(context, 'terms_of_use'),
                                style: const TextStyle(
                                  color: Color(0xFF4B4B4B),
                                  fontSize: 15,
                                ),
                              ),)

                          ],
                        ),
                        SizedBox(
                          height: context.height * 0.03,
                        ),
                        BlocConsumer<AuthCubit, AuthStates>(
                          listener: (BuildContext context, AuthStates state){
                            if(state is RegisterSuccessState){
                              navigateTo(context: context, routeName: AppString.appLayout);
                            }else if(state is RegisterErrorState){
                              showToast(state.error.toString());
                            }
                          },
                          builder: (BuildContext context, AuthStates state) {
                            if(state is LoadingRegisterState){
                              if(Platform.isIOS){
                                return const CupertinoActivityIndicator();
                              }
                              return const CircularProgressIndicator();
                            }
                            var cubit = AuthCubit.get(context);
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
                          },
                        ),
                        SizedBox(
                          height: context.height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              getLang(context, 'already_have_ac'),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                getLang(
                                  context,
                                  'login',
                                ),
                                style: Theme.of(context).textTheme.button!.copyWith(
                                  color: AppColor.defaultColor,
                                ),
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
      },
    );
  }

  String? validationText(value) {
    if (value.isNotEmpty) {
      return null;
    } else {
      return getLang(context, 'required');
    }
  }


  void _validationIos(AuthCubit cubit){
    // not valid
    if(_userNameController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty
    ){
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('Fields are Empty'),
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
      cubit.register(
        userName: _userNameController.text,
        phoneNumber: _phoneNumberController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );
    }
  }
  void _validationAndroid(AuthCubit cubit){
    if(_formKey.currentState!.validate()){
      cubit.register(
        userName: _userNameController.text,
        phoneNumber: _phoneNumberController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );
    }
  }

}
