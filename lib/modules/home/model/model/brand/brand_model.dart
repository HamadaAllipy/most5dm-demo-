class BrandModel{
  int? id;
  String? name;
  String? category;
  int? categoryId;
  String? iconUri;

  BrandModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    category = json['category'];
    categoryId = json['categoryId'];
    iconUri = json['iconUri'];
  }
}