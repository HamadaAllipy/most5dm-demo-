class MainCategoryModel{

  int? id;
  String? name;
  String? iconUri;

  MainCategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    iconUri = json['iconUri'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'iconUri': iconUri,
      };
}