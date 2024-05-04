import 'dart:convert';

import 'package:blueuniform/DataAccesslayer/Models/category.dart';
import 'package:blueuniform/DataAccesslayer/Models/product.dart';

class Favorite {
   Category? category;
   Product? product;

  Favorite({
    required this.category,
    required this.product,
  });

 factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        category: json["category"] ,
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "product": product,
      };
}
