import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:most5dm/components/toast.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_locale.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController paymentController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 40,
                ),
                const BuildLogo(),
                DefaultTextForm(
                  label: getLang(context, 'userName'),
                  textEditingController: nameController,
                  prefixIcon: Icons.perm_contact_cal,
                  formFieldValidator: _validation,
                  onChanged: (value){
                    if(value.contains(' ')){

                    }
                  },
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DefaultTextForm(
                  label: getLang(context, 'phone_number'),
                  textEditingController: phoneController,
                  prefixIcon: Icons.phone,
                  formFieldValidator: _validation,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DefaultTextForm(
                  label: getLang(context, 'email'),
                  textEditingController: emailController,
                  prefixIcon: Icons.email,
                  formFieldValidator: _validation,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    var cubit = AuthCubit.get(context);
                    return DefaultTextForm(
                      label: getLang(context, 'password'),
                      textEditingController: passwordController,
                      prefixIcon: Icons.lock,
                      formFieldValidator: _validation,
                      keyboardType: TextInputType.visiblePassword,
                      obscure: cubit.isHide,
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
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DefaultTextForm(
                  label: getLang(context, 'payment_card'),
                  textEditingController: paymentController,
                  prefixIcon: Icons.payment,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state){
                    if(state is RegisterSuccessState){
                      NavigatorComponents.navigateToAndFinish(context: context, routeName: AppString.appLayout);
                    }
                    else if(state is RegisterErrorState){
                      showToast(state.error.toString());
                    }
                  },
                  builder: (context , state) {
                    if(state is LoadingRegisterState){
                      return const CircularProgressIndicator();
                    }
                    return DefaultButton(
                      text: getLang(context, 'register'),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          AuthCubit.get(context).register(
                            fullName: nameController.text,
                            phoneNumber: phoneController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: passwordController.text,
                            paymentCard: paymentController.text,
                          );
                        } else {
                          print('Not validate');
                        }
                      },
                    );
                  }
                ),
                DefaultTextButton(
                  text: getLang(context, 'already_have_ac'),
                  textButton: getLang(context, 'login'),
                  onPressed: () {},
                ),
              ],
            ),
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
}
