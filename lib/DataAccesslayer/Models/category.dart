import 'dart:convert';

import 'package:blueuniform/DataAccesslayer/Models/product.dart';

class Category {
  final int id;
  final String name;
  final String image;
  final num price;
  final  List<Product>? products;
  final String createdAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
     this.products,
    required this.createdAt,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      price: map['price'] ?? "",
      products:  map['products'] != null
          ? detailsfromJson(jsonEncode(map['products']))
          : null,
      createdAt: map['created_at'] ?? "",
    );
  }
  factory Category.fromMapcart(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      price: map['price'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }
static List<Product> detailsfromJson(String json) {
    final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  }

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

 
}
