import 'dart:convert';

class Product {
  final int id;
  final String size;
  final int quantity;
  final String createdAt;

  Product({
    required this.id,
    required this.size,
    required this.quantity,
    required this.createdAt,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      size: map['size'] as String,
      quantity: map['quantity'] as int,
      createdAt: map['created_at'] as String,
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
