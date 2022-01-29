import 'package:most5dm/modules/auth/model/model/login_model.dart';

abstract class AuthStates{}

class InitialAuthState extends AuthStates{}

class ToggleObscureAuthState extends AuthStates{
  bool isHide;
  ToggleObscureAuthState(this.isHide);
}


class LoadingLoginState extends AuthStates{}
class LoginSuccessState extends AuthStates{

  final LoginModel model;

  LoginSuccessState(this.model);

}
class LoginErrorState extends AuthStates{
  String error;
  LoginErrorState(this.error);
}

class LoadingRegisterState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class RegisterErrorState extends AuthStates{
  String error;
  RegisterErrorState(this.error);
}

class ValidState extends AuthStates{}
class NotValidState extends AuthStates{}
class FieldIsEmptyState extends AuthStates{}
class ToggleCheckedBoxState extends AuthStates{}