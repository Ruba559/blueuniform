
import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../Models/cart.dart';
import '../Models/favorite.dart';

class BoxClient {
  final box = GetStorage();


  Future<List<Cart>> getCartItems() async {
    var cartItems = await box.read('cart_items');
    if (cartItems != null) {
      final data =
          cartItems.cast<Map<String, dynamic>>();
      return data
          .map<Cart>((json) => Cart.fromMap(json))
          .toList();
    }
    return [];
  }

  Future<void> addToCart(List<Cart> cartItems) async {
    await box.remove('cart_items');
    var map = cartItems.map((e) => e.toMap());
    await box.write('cart_items', map.toList());
  }
 

  // Future<List<Cart>> getCartItems() async {
  //   var cartItems = await box.read('cart_items');
  //   print(cartItems);
  //   if (cartItems != null && cartItems != "") {
  //     final data = cartItems.cast<Map<String, dynamic>>();
  //     return data.map<Cart>((json) => Cart.fromMap(json)).toList();
  //   }

  //   return [];
  // }

  // Future<void> addToCart(List<Cart> cartItems) async {
  //   await box.remove('cart_items');
  //   print(cartItems);
  //   var map = cartItems.map((item) => item.toJson());
  //   await box.write('cart_items', map.toList());
  // }


  Future<List<Favorite>> getFavoriteItems() async {
    var favoriteItems = await box.read('favorite_items');
    if (favoriteItems != null) {
      final data =
          favoriteItems.cast<Map<String, dynamic>>();
      return data
          .map<Favorite>((json) => Favorite.fromMap(json))
          .toList();
    }
    return [];
  }

  Future<void> addToFavorite(List<Favorite> favoriteItems) async {
    await box.remove('favorite_items');
    var map = favoriteItems.map((e) => e.toMap());
    await box.write('favorite_items', map.toList());
  }
 
}
