import 'package:flutter/material.dart' show BuildContext;
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
      print('status =${model.status}\n message ${model.message}');
      if (model.status == 'True') {
        emit(LoginSuccessState());
      }
      else if (model.status == 'Unauthorized') {
        emit(LoginErrorState(model.message.toString()));
      }
      else if (model.status == 'Error') {
        emit(LoginErrorState(model.message.toString()));
      }
      else {
        print('??????????');
      }
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
      username: 'hamada mohamed seif',
      email: 'hamada.devlop@gmail.com',
      phoneNumber: '01141403984',
      paymentCard: '123456789',
      password: '123456789',
      confirmPassword: '123456789',
    );
    DioHelper.postData(endPoint: REGISTER, data: sendRegister.toJson()).then((
        value) {
      emit(RegisterSuccessState());
      print(value!.data);
    }).catchError((e) {
      emit(RegisterErrorState(e.toString()));
    });
  }

  validation(String value) {
    if(value.isEmpty){
      empty = true;
      emit(fieldIsEmptyState());
    }
    else if(value.isNotEmpty){
      empty = false;
    if(value.startsWith('05')){
    _valid = true;
    emit(ValidState());
    }
    else{
    _valid = false;
        emit(NotValidState());
      }
    }

  }
}
