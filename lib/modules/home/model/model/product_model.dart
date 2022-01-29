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

  ProductModel({
    this.image =
        'https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MTJ8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80',
    this.name = 'سيارة مرسيدس بينز',
    this.shortDesc = 'موديل 2017',
    this.price = 500.0,
    this.location = 'جده',
  });

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
  }
}
