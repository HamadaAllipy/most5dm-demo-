class GetRegister{
  String? message;
  bool? isAuthenticated;
  String? username;
  String? phoneNumber;
  List<String>? roles;
  String? token;
  String? expiresOn;

  GetRegister.fromJson(Map<String, dynamic> json){
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
    roles = json['roles'];
    token = json['token'];
    expiresOn = json['expiresOn'];
  }
}