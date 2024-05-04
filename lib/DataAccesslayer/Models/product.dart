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
      size: map['size'] ?? "",
      quantity: map['quantity'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'size': size,
      'quantity': quantity,
      'created_at': createdAt,
    };
  }
}
