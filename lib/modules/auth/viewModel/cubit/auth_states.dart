abstract class AuthStates{}

class InitialAuthState extends AuthStates{}

class ToggleObscureAuthState extends AuthStates{
  bool isHide;
  ToggleObscureAuthState(this.isHide);
}


class LoadingLoginState extends AuthStates{}
class LoginSuccessState extends AuthStates{}
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
class fieldIsEmptyState extends AuthStates{}