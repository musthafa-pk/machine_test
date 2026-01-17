class ProductModel {
  final int productId;
  final String name;
  final String image;
  final String price;
  final String oldPrice;

  ProductModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      name: json['name'],
      image: json['image'] ?? '',
      price: json['price'] ?? '',
      oldPrice: json['oldprice'] ?? '',
    );
  }
}
