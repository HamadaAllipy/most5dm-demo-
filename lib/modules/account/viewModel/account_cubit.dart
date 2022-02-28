import 'dart:convert';

import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/end_points.dart';
import 'package:most5dm/modules/account/model/edit_model.dart';
import 'package:most5dm/modules/account/viewModel/account_states.dart';
import 'package:most5dm/modules/auth/model/model/login_model.dart';

class AccountCubit extends Cubit<AccountStates>{

  String? _newUserName;
  String? _newEmail;
  String? _newPhoneNumber;
  String? _newPaymentCard;

  AccountCubit() : super(InitialAccountState());

  static AccountCubit get(BuildContext context) => BlocProvider.of(context);




  void editProfile({
    required String token,
    required String phoneNumber,
    required String password,
  }) async{
    Future.delayed(const Duration(seconds: 2)).then((value){
      DioHelper.patch(
        headers: {
          'Authorization':'Bearer $token',
        },
        endPoint: EDIT,
        data: {
          'phoneNumber': '0523456788',
          'password': '123456789',
          'newUsername':_newUserName,
          'newEmail':_newEmail,
          'newPhoneNumber':_newPhoneNumber,
          'newPaymentCard': _newPaymentCard,
        },
      ).then((value) {
        EditModel editModel = EditModel.fromJson(value!.data);
        print('DONE EDIT ${editModel.dataEditModel!.userName}');
        // CashHelper.toCash(key: AppString.TOKEN, value: editModel.dataEditModel!.token.toString());
        // CashHelper.toCash(key: 'user', value: jsonEncode(editModel.dataEditModel!.toJson()));
        //
        loginWithPhoneNumber(
          phoneNumber: '0523456788',
          password: '123456789',
        ).then((value){

        }).catchError((onError){
          emit(EditErrorState());
          print('Error:: $onError');
        });
      }).catchError((onError){
        emit(EditErrorState());
        print('Error:: $onError');
      });
    });

  }



  Future<void> loginWithPhoneNumber({
    required String phoneNumber,
    required String password,
  }) async{
    SendLogin sendLogin = SendLogin(phoneNumber, password);
    DioHelper.postData(
      endPoint: LOGIN,
      data: sendLogin.toJson(),
    ).then((value) {
      LoginModel model = LoginModel.fromJson(value!.data);
      if (model.status == AppString.TRUE) {
        CashHelper.toCash(key: AppString.TOKEN, value: model.data!.token.toString());
        CashHelper.toCash(key: 'user', value: jsonEncode(model.data!.toJson()));
        emit(EditSuccessState());
      } else if (model.status == AppString.UNAUTHORIZED) {
        emit(EditErrorState());
        print('Error:: ${model.message.toString()}');
      } else if (model.status == AppString.ERROR) {
        emit(EditErrorState());
        print('Error:: ${model.message.toString()}');
      } else {
        showToast(AppString.UNKNOWN);
      }
    }).catchError((onError){
      emit(EditErrorState());
      print('Error:: ${onError.toString()}');
    });
  }

  void canUserNameEdit(bool isEditing, String? value) {
    if(isEditing){
      _newUserName = value;
    }
    else{
      _newUserName = null;
    }
  }

  void canEmailEdit(bool isEditing, String? value) {
    if(isEditing){
      _newEmail = value;
    }
    else{
      _newEmail = null;
    }
  }

  void canPhoneNumber(bool isEditing, String? value) {
    if(isEditing){
      _newPhoneNumber = value;
    }
    else{
      _newPhoneNumber = null;
    }
  }

  void canPayment(bool isEditing, String? value) {
    if(isEditing){
      _newPaymentCard = value;
    }
    else{
      _newPaymentCard = null;
    }
  }
}