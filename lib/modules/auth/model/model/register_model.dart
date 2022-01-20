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

class RegisterModel{

  String? status;
  String? message;
  RegisterData? data;

  RegisterModel(this.status, this.message, this.data);

  RegisterModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = RegisterData.fromJson(json['data']);
  }
}

class RegisterData{
  String? userName;
  String? phoneNumber;
  String? password;
  String? email;
  String? paymentCard;
  String? picture;
  List<dynamic>? roles;
  String? token;
  String? expiresOn;
  RegisterData.fromJson(Map<String, dynamic> json){
    userName = json['username'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    email = json['email'];
    paymentCard = json['paymentCard'];
    picture = json['picture'];
    roles = json['roles'];
    token = json['token'];
    expiresOn = json['expiresOn'];
  }
}
