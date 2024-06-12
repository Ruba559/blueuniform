import 'dart:convert';
import 'package:blueuniform/DataAccesslayer/Models/category.dart';
import 'package:blueuniform/DataAccesslayer/Models/product.dart';

class Cart {
  num quantity;
  String name;
  String image;
  num price;
  int productId;
  int categoryId;

  Cart({
    required this.quantity,
    required this.name,
    required this.image,
    required this.price,
    required this.productId,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'name': name,
      'image': image,
      'price': price,
      'product_id': productId,
      'category_id': categoryId,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      quantity: map['quantity'] as num,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
      productId: map['product_id'] as int,
      categoryId: map['category_id'] as int,
      //category: Category.fromMapcart(map['category']),
    );
  }
  //  int quantity;
  //  Category? category;
  //  Product? product;

  //Cart(
  //{
  //   required this.quantity,
  //   required this.category,
  //   required this.product,
  // });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     "quantity": quantity,
  //     "category": category,
  //     "product": product,
  //   };
  // }

  // factory Cart.fromMap(Map<String, dynamic> map) {
  //   return Cart(
  //       quantity: map["quantity"] ?? 0,
  //       category:  Category.fromMapcart(map['category']) ,
  //       product: Product.fromMap(map['product']),
  //   );
  // }
  //   String toJson() => json.encode(toMap());
  // factory Cart.fromJson(String source) =>
  //     Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  // factory Cart.fromJson(Map<String, dynamic> json) => Cart(
  //    quantity: json["quantity"] ,
  //       category: json["category"],
  //       product: json["product"],
  //     );
}
