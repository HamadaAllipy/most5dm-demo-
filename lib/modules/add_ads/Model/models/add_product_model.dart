class AddProductModel {
  String? name;
  String? nameAR;
  int? price;
  String? productShortDesc;
  String? productShortDescAR;
  String? productLongDesc;
  String? productLongDescAR;
  int? brandId;
  String? iconUri;
  int? cityId;
  List<String>? images;

  AddProductModel({
    required this.name,
    required this.nameAR,
    required this.price,
    required this.productShortDesc,
    required this.productShortDescAR,
    required this.productLongDesc,
    required this.productLongDescAR,
    required this.brandId,
    required this.iconUri,
    required this.cityId,
    required this.images,
});

  Map<String, dynamic> toJson() => {
        'name': name,
        'nameAR': nameAR,
        'price': price,
        'productShortDesc': productShortDesc,
        'productShortDescAR': productShortDescAR,
        'productLongDesc': productLongDesc,
        'productLongDescAR': productLongDescAR,
        'brandId': brandId,
        'iconUri': iconUri,
        'cityId': cityId,
        'images': images,
      };
}
