class SendEditModel{
  final String phoneNumber;
  final String password;
  String? newUserName;
  String? newEmail;
  String? newPhoneNumber;

  SendEditModel({
    required this.phoneNumber,
    required this.password,
    this.newEmail,
    this.newPhoneNumber,
    this.newUserName,
});

  // Map<String, dynamic> toJson() =>{
  //   'phoneNumber': phoneNumber,
  //   'password': password,
  // };
}

class EditModel{

  String? status;
  String? message;
  DataEditModel? dataEditModel;

  EditModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    if(json['data'] != null){
      dataEditModel = DataEditModel.fromJson(json['data']);
    }
  }
}


class DataEditModel{

  String? userName;
  String? phoneNumber;
  String? email;
  String? paymentCard;
  String? picture;
  String? token;

  DataEditModel.fromJson(Map<String, dynamic> json){
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    paymentCard = json['paymentCard'];
    picture = json['picture'];
    token = json['token'];
  }

  Map<String, dynamic> toJson()=>{
    'userName':userName,
    'phoneNumber':phoneNumber,
    'email':email,
    'paymentCard':paymentCard,
    'picture':picture,
    'token':token,
  };
}