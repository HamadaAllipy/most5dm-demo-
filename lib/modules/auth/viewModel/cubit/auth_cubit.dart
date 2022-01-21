import 'package:flutter/material.dart' show BuildContext, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/constants/end_points.dart';
import 'package:most5dm/modules/auth/model/model/login_model.dart';
import 'package:most5dm/modules/auth/model/model/register_model.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  bool _isHide = true;

  bool _valid = false;
  bool empty = true;

  AuthCubit() : super(InitialAuthState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  void toggleObscure() {
    _isHide = !_isHide;
    emit(ToggleObscureAuthState(_isHide));
    print('toggleObscure');
  }

  bool get isHide => _isHide;

  bool get valid => _valid;


  void loginWithPhoneNumber({
    required String phoneNumber,
    required String password,
  }) {
    SendLogin sendLogin = SendLogin(phoneNumber, password);
    emit(LoadingLoginState());
    print('${sendLogin.toJson()}');
    DioHelper.postData(
      endPoint: LOGIN,
      data: sendLogin.toJson(),
    ).then((value) {
      LoginModel model = LoginModel.fromJson(value!.data);
      if (model.status == 'True') {
        emit(LoginSuccessState());
      } else if (model.status == 'Unauthorized') {
        emit(LoginErrorState(model.message.toString()));
      } else if (model.status == 'Error') {
        emit(LoginErrorState(model.message.toString()));
      } else {
        print('??????????');
      }
    }).catchError((onError){
      print('ERROR::: ${onError.toString()}');
      emit(LoginErrorState(onError.toString()));
    });
  }

  void register({
    required String fullName,
    required String phoneNumber,
    required String email,
    required String password,
    required String confirmPassword,
    required String paymentCard,
  }) async {
    emit(LoadingRegisterState());
    SendRegister sendRegister = SendRegister(
      username: fullName,
      email: email,
      phoneNumber: phoneNumber,
      paymentCard: paymentCard,
      password: password,
      confirmPassword: password,
    );
    DioHelper.postData(endPoint: REGISTER, data: sendRegister.toJson())
        .then((value) {
      print(value!.data);
      RegisterModel registerModel = RegisterModel.fromJson(value.data);
      if (registerModel.status == 'True') {
        emit(RegisterSuccessState());
      } else {
        print('error{}{}{}{}{}');
        // emit(RegisterErrorState(registerModel.message.toString()));
      }
    }).catchError((e) {
      print('error{}{}{}{}{}');
      // emit(RegisterErrorState(e.toString()));
    });
  }

  validationIcon(String value) {
    if (value.isEmpty) {
      empty = true;
      emit(fieldIsEmptyState());
    } else if (value.isNotEmpty) {
      empty = false;
      if (value.startsWith('05')) {
        _valid = true;
        emit(ValidState());
        if (value.length > 10) {
          _valid = false;
          emit(NotValidState());
        }
      } else {
        _valid = false;
        emit(NotValidState());
      }
    }
  }
}
