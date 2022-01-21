/// send data {phone number and password}to login api
class SendLogin{
  final String? phoneNumber;
  final String? password;

  SendLogin(this.phoneNumber, this.password);

  Map<String, dynamic> toJson()=>{
    'phoneNumber':phoneNumber,
    'password': password,
  };
}

// get data from api
class LoginModel {
  String? status;
  String? message;
  DataModel? data;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    if(json['data'] != null){
      data = DataModel.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson()=>{
    'status': status,
    'message': message,
  };
}

class DataModel {
  String? userName;
  String? phoneNumber;
  String? email;
  String? paymentCard;
  String? picture;
  List<dynamic>? roles;
  String? token;
  String? expiresOn;

  DataModel.fromJson(Map<String, dynamic> json){
    userName = json['username'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    paymentCard = json['paymentCard'];
    picture = json['picture'];
    roles = json['roles'];
  }

}
