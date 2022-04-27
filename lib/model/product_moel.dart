import 'dart:convert';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String productCategoryName;
  final String brand;
  final int quantity;
  final bool? isFav;
  final bool isPopular;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.productCategoryName,
    required this.brand,
    required this.quantity,
    this.isFav,
    required this.isPopular,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'productCategoryName': productCategoryName,
      'brand': brand,
      'quantity': quantity,
      'isFav': isFav,
      'isPopular': isPopular,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      title: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      imageUrl: map['imageUrl'] ?? '',
      productCategoryName: map['productCategoryName'] ?? '',
      brand: map['brand'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      isFav: map['isFav'] ?? false,
      isPopular: map['isPopular'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
