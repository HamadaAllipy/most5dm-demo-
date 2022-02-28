import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/constants/custom_icon_icons.dart';
import 'package:most5dm/modules/account/viewModel/account_cubit.dart';
import 'package:most5dm/modules/auth/model/model/login_model.dart';
import 'package:most5dm/modules/auth/view/screen/login_screen.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button_.dart';
import 'package:most5dm/modules/account/view/screens/edit_profile_screen.dart';
import 'package:most5dm/modules/edit_profile/view/widgets/field_view.dart';
import 'package:most5dm/shared/widgets/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}


class _ViewProfileScreenState extends State<ViewProfileScreen> {


  late DataModel _dataModel;
  @override
  void initState() {
    super.initState();
    try {
      Map<String,dynamic> userMap = jsonDecode(getUserModel()!) as Map<String, dynamic>;
      print('VIEW PROFILE SCREEN $userMap');
      _dataModel = DataModel.fromJson(userMap);
    } on Exception catch (e) {
      print(
        'ERROR =>>> $e',
      );
    }
  }

  String? getUserModel(){
    return CashHelper.getString(key: 'user');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F7F7),
      padding: EdgeInsetsDirectional.only(
        top: context.height * 0.008,
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
              clipBehavior: Clip.antiAlias,
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
                    blurRadius: 5,
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
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              pushNewScreen(
                                context,
                                screen: EditProfileScreen(_dataModel),
                                withNavBar: false, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                              );
                              // navigateToAndFinishByWidget(context, const EditProfileScreen(),);
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              //   return const EditProfileScreen();
                              // }),);
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
                        ],
                      ),
                       FieldView(
                        icon: AppIcons.user,
                        text: _dataModel.userName??'',
                      ),
                      SizedBox(
                        height: context.height * 0.018,
                      ),
                       FieldView(
                        icon: AppIcons.mail_alt,
                        text: _dataModel.email??'',
                      ),
                      SizedBox(
                        height: context.height * 0.018,
                      ),
                       FieldView(
                        icon: Icons.phone,
                        text: _dataModel.phoneNumber??'',
                      ),
                      SizedBox(
                        height: context.height * 0.018,
                      ),
                       FieldView(
                        icon: Icons.credit_card_rounded,
                        text: _dataModel.paymentCard??'',
                      ),
                      SizedBox(
                        height: context.height * 0.018,
                      ),
                      const FieldView(
                        icon: Icons.lock,
                        text: '',
                        obscure: true,
                      ),
                      SizedBox(
                        height: context.height * 0.018,
                      ),
                      DefaultButton(
                        onPressed: () {
                          CashHelper.clearData().then(
                            (value) => navigateToOutSideBottomNav(
                              context: context,
                              widget: const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'تسجيل خروج',
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
    );
  }


}
