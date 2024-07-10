import 'dart:convert';

import 'package:blueuniform/DataAccesslayer/Models/size.dart';

class Product {
  final int id;
  final String size;
  final int quantity;
   List<Size>? sizes;
  final String createdAt;

  Product({
    required this.id,
    required this.size,
    required this.quantity,
     required this.sizes,
    required this.createdAt,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      size: map['size'] as String,
      quantity: map['quantity'] as int,
        sizes: map['sizes'] != null
          ? sizesfromJson(jsonEncode(map['sizes']))
          : null,
      createdAt: map['created_at'] as String,
    );
  }
    static List<Size> sizesfromJson(String json) {
    final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
    return parsed.map<Size>((json) => Size.fromMap(json)).toList();
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
