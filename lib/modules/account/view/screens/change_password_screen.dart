import 'package:flutter/material.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/edit_profile/view/widgets/build_text_feild.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();



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
                          controller: oldPasswordController,
                          label: 'كلمة المرور القديمه',
                          prefixIcon: Icons.lock,
                        ),
                        SizedBox(
                          height: context.height * 0.018,
                        ),
                        BuildTextField(
                          controller: newPasswordController,
                          label: 'كلمة المرور الجديدة',
                          // initialValue: 'محمد عم',
                          prefixIcon: Icons.lock,
                        ),
                        SizedBox(
                          height: context.height * 0.018,
                        ),
                        BuildTextField(
                          controller: newPasswordController,
                          label: 'تأكيد كلمة المرور الجديده',
                          // initialValue: 'محمد عم',
                          prefixIcon: Icons.lock,
                        ),
                        SizedBox(
                          height: context.height * 0.018,
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
