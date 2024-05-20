import 'dart:convert';

import 'package:blueuniform/DataAccesslayer/Models/category.dart';
import 'package:blueuniform/DataAccesslayer/Models/product.dart';

class Favorite {
  Category? category;
  Product? product;
  int product_id;
  Favorite({
    required this.category,
    required this.product,
    required this.product_id,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        category: json["category"],
        product: json["product"],
         product_id: json["product_id"] ?? 0,
      );



  Map<String, dynamic> toJson() => {
        "category": category,
        "product": product,
         "product_id": product_id  ,
      };
}
