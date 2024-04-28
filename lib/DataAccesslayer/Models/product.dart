import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String image;
  final String price;
  final String createdAt;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.createdAt,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      price: map['price'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price' : price,
      'created_at': createdAt,
    };
  }
}
