class SendRegister {
  final String username;
  final String email;
  final String phoneNumber;
  final String paymentCard;
  final String password;
  final String confirmPassword;

  SendRegister({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.paymentCard,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'paymentCard': paymentCard,
        'password': password,
        'confirmPassword': confirmPassword,
      };
}

class RegisterModel {
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? paymentCard;
  final String? password;
  final String? confirmPassword;

  RegisterModel({
    required this.userName,
    required this.phoneNumber,
    required this.password,
    required this.paymentCard,
    required this.confirmPassword,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'username': userName,
        'email': email,
        'phoneNumber': phoneNumber,
        'paymentCard': paymentCard,
        'password': password,
        'confirmPassword': confirmPassword
      };
}
