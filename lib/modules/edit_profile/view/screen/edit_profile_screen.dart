import 'package:flutter/material.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/edit_profile/view/screen/change_password_screen.dart';
import 'package:most5dm/modules/edit_profile/view/widgets/build_text_feild.dart';
import 'package:most5dm/modules/edit_profile/view/widgets/field_view.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController paymentCardController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    userNameController.text = 'محمد عمر';
    emailController.text = 'hamada.devlop@gmail.com';
    phoneController.text = '0523456788';
    paymentCardController.text = '758934759834758943';
    passwordController.text = '894375983475';
  }

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: Container(
        color: const Color(0xFFF7F7F7),
        padding: EdgeInsetsDirectional.only(
          top: context.height * 0.018,
          start: context.width * 0.056,
          end: context.width * 0.056,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Container(
                width: context.width * 0.88,
                height: context.height * 0.26,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/background_landscape.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        bottom: context.height * 0.014,
                        end: context.width * 0.029,
                      ),
                      child: Container(
                        width: context.width * 0.40,
                        height: context.height * 0.19,
                        decoration: BoxDecoration(
                          color: AppColor.defaultColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Container(
                          width: context.width * 0.39,
                          height: context.height * 0.18,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg',
                                ),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 20,
                          ),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor:
                            const Color(0xFF000000).withOpacity(0.56),
                            child: const Icon(
                              AppIcons.picture,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.026,
              ),
              SizedBox(
                height: context.height * 0.56,
                width: context.width * 0.88,
                child: Card(
                  color: const Color(0xFFF7F7F7),
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: context.width * 0.037,
                      end: context.width * 0.037,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        BuildTextField(
                          controller: userNameController,
                          label: 'اسم المستخدم',
                          // initialValue: 'محمد عم',
                          prefixIcon: AppIcons.user,
                        ),
                        SizedBox(
                          height: context.height * 0.018,
                        ),
                        BuildTextField(
                          controller: emailController,
                          label: 'البريد الاكترني',
                          // initialValue: 'محمد عم',
                          prefixIcon: AppIcons.user,
                        ),
                        SizedBox(
                          height: context.height * 0.018,
                        ),
                        BuildTextField(
                          controller: phoneController,
                          label: 'رقم الهاتف',
                          // initialValue: 'محمد عم',
                          prefixIcon: AppIcons.user,
                        ),
                        SizedBox(
                          height: context.height * 0.018,
                        ),
                        BuildTextField(
                          controller: paymentCardController,
                          label: 'رقم الحساب البنكي',
                          // initialValue: 'محمد عم',
                          prefixIcon: AppIcons.user,
                        ),
                        SizedBox(
                          height: context.height * 0.018,
                        ),
                        Container(
                          height: context.height * 0.056,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: BuildTextField(
                                  obscure: true,
                                  controller: passwordController,
                                  label: 'كلمه المرور',
                                  // initialValue: 'محمد عم',
                                  prefixIcon: AppIcons.user,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsetsDirectional.only(
                                      end: context.width * 0.037,
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context){
                                              return const ChangePasswordScreen();
                                            }),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'تعديل',
                                            style: Theme.of(context)
                                                .textTheme
                                                .button!
                                                .copyWith(
                                                color: AppColor.secondColor,
                                                fontSize: context.height * 0.023),
                                          ),
                                          Icon(
                                            Icons.edit,
                                            color: AppColor.secondColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.06,
                        ),
                        DefaultButton(
                          onPressed: () {},
                          child: Text(
                            'حفظ التغيرات ',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
