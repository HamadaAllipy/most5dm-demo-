class CityModel{
  int? id;
  String? name;
  int? countryId;

  CityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    countryId = json['countryId'];
  }
}