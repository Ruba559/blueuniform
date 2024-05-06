import 'package:get_storage/get_storage.dart';

import '../Models/Favorite.dart';
import '../Models/cart.dart';

class BoxClient {
  final box = GetStorage();

  Future<List<Cart>> getCartItems() async {
    var cartItems = await box.read('cart_items');
    print(cartItems);
    if (cartItems != null && cartItems != "") {
      final data = cartItems.cast<Map<String, dynamic>>();
      return data.map<Cart>((json) => Cart.fromJson(json)).toList();
    }

    return [];
  }

  Future<void> addToCart(List<Cart> cartItems) async {
    await box.remove('cart_items');
    print(cartItems);
    var map = cartItems.map((item) => item.toJson());
    await box.write('cart_items', map.toList());
    
  }

  Future<List<Favorite>> getFavoriteItems() async {
    print('favorite_items');
    var favoriteItems = await box.read('favorite_items');
    print(favoriteItems);
    if (favoriteItems != null && favoriteItems != "") {
      final data = favoriteItems.cast<Map<String, dynamic>>();
      return data.map<Favorite>((json) => Favorite.fromJson(json)).toList();
    }

    return [];
  }

  Future<void> addToFavorite(List<Favorite> favoriteItems) async {
    print('hihihi');
    print(favoriteItems);
    await box.remove('favorite_items');
    var map = favoriteItems.map((item) => item.toJson());
    await box.write('favorite_items', map.toList());
  }
}
