import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/account/view/screens/change_password_screen.dart';
import 'package:most5dm/modules/account/view/screens/view_profile_screen.dart';
import 'package:most5dm/modules/account/viewModel/account_cubit.dart';
import 'package:most5dm/modules/account/viewModel/account_states.dart';
import 'package:most5dm/modules/auth/model/model/login_model.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/auth/view/widgets/default_text_form.dart';
import 'package:most5dm/modules/edit_profile/view/widgets/build_text_feild.dart';
import 'package:most5dm/modules/edit_profile/view/widgets/field_view.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class EditProfileScreen extends StatefulWidget {

  final DataModel _dataModel;

  const EditProfileScreen(this._dataModel,[Key? key]) : super(key: key);

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
    userNameController.text = widget._dataModel.userName??'';
    emailController.text = widget._dataModel.email??'';
    phoneController.text = widget._dataModel.phoneNumber??'';
    paymentCardController.text = widget._dataModel.paymentCard??'';
    passwordController.text = '894375983475';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: CustomStatusBar(
        child: Container(
          color: const Color(0xFFF7F7F7),
          padding: EdgeInsetsDirectional.only(
            top: context.height * 0.018,
            start: context.width * 0.056,
            end: context.width * 0.056,
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<AccountCubit, AccountStates>(
              builder: (context, state){
                return  Column(
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
                                onChanged: (value){
                                  if(value != widget._dataModel.userName){
                                    // set update user name to api

                                    AccountCubit.get(context).canUserNameEdit(true, value);
                                  }
                                  else{
                                    // nothing
                                    AccountCubit.get(context).canUserNameEdit(false, null);
                                  }
                                },

                              ),
                              SizedBox(
                                height: context.height * 0.018,
                              ),
                              BuildTextField(
                                controller: emailController,
                                label: 'البريد الاكترني',
                                // initialValue: 'محمد عم',
                                prefixIcon: AppIcons.user,
                                onChanged: (value){
                                  if(value != widget._dataModel.email){
                                    // set update user name to api

                                    AccountCubit.get(context).canEmailEdit(true, value);
                                  }
                                  else{
                                    // nothing
                                    AccountCubit.get(context).canEmailEdit(false, null);
                                  }
                                },
                              ),
                              SizedBox(
                                height: context.height * 0.018,
                              ),
                              BuildTextField(
                                controller: phoneController,
                                label: 'رقم الهاتف',
                                prefixIcon: AppIcons.user,
                                onChanged: (value){
                                  if(value != widget._dataModel.phoneNumber){
                                    // set update user name to api

                                    AccountCubit.get(context).canPhoneNumber(true, value);
                                  }
                                  else{
                                    // nothing
                                    AccountCubit.get(context).canPhoneNumber(false, null);
                                  }
                                },
                              ),
                              SizedBox(
                                height: context.height * 0.018,
                              ),
                              BuildTextField(
                                controller: paymentCardController,
                                label: 'رقم الحساب البنكي',
                                // initialValue: 'محمد عم',
                                prefixIcon: AppIcons.user,
                                onChanged: (value){
                                  if(value != widget._dataModel.paymentCard){
                                    // set update user name to api

                                    AccountCubit.get(context).canPayment(true, value);
                                  }
                                  else{
                                    // nothing
                                    AccountCubit.get(context).canPayment(false, null);
                                  }
                                },
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
                                        enabled: false,
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
                              BlocConsumer<AccountCubit, AccountStates>(
                                listener: (context, state){
                                  if(state is EditSuccessState){
                                    print('TAG TAG TAG ${CashHelper.getString(key: 'user')}');
                                    navigateToAndFinishByWidget(context, const ViewProfileScreen());
                                  }
                                },
                                builder: (context, state){
                                  return DefaultButton(
                                    onPressed: () {
                                      AccountCubit cubit = AccountCubit.get(context);
                                      cubit.editProfile(
                                        token:
                                            widget._dataModel.token.toString(),
                                        phoneNumber: widget._dataModel.phoneNumber.toString(),
                                        password: '123456789'
                                      );
                                    },
                                    child: Text(
                                      'حفظ التغيرات ',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
