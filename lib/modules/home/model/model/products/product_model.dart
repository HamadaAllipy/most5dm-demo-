class ProductModel {
  int? id;
  String? name;
  num? price;
  String? shortDesc;
  String? longDesc;
  int? quantity;
  String? brand;
  int? brandId;
  String? image;
  String? location;
  int? cityId;


  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    shortDesc = json['productShortDesc'];
    longDesc = json['productLongDesc'];
    quantity = json['quantity'];
    brand = json['brand'];
    brandId = json['brandId'];
    image = json['iconUri'];
    quantity = json['quantity'];
    cityId = json['cityId'];
  }
}
