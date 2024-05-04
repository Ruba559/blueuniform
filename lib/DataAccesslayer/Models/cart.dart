import 'dart:convert';

import 'package:blueuniform/DataAccesslayer/Models/category.dart';
import 'package:blueuniform/DataAccesslayer/Models/product.dart';

class Cart {
   int quantity;
   Category? category;
   Product? product;

  Cart({
    required this.quantity,
    required this.category,
    required this.product,
  });

 factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        quantity: json["quantity"] ?? 0,
        category: json["category"] ,
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "category": category,
        "product": product,
      };
}
