import 'dart:convert';

import 'package:blueuniform/DataAccesslayer/Models/category.dart';
import 'package:blueuniform/DataAccesslayer/Models/product.dart';

class Favorite {
  String name;
  String image;
  num price;
  int categoryId;

  Favorite({
    required this.name,
    required this.image,
    required this.price,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'price': price,
      'category_id': categoryId,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
       categoryId: map['category_id'] as int,
    );
  }
}
