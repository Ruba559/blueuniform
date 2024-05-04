import 'package:blueuniform/Controllers/CartController.dart';
import 'package:blueuniform/Controllers/FavoritesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/cart.dart';
import '../DataAccesslayer/Models/category.dart';
import '../DataAccesslayer/Models/product.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  late Product? product;
  var quantity = 1;

  Category? category = Get.arguments;

  CartController cartController = CartController();

  FavoritesController favoritesController = FavoritesController();

  late Cart cart;
  late var items = [];

  BoxClient boxClient = BoxClient();
  List<Cart> cartItems = [];

  void onInit() async {
    cartController.getCartItemsFromStorage();
    favoritesController.getFavoriteItemsFromStorage();
    product = category!.products!.first;
    update();
    super.onInit();
  }

  selectSize(value) {
    product = value;
    update();
  }

  selectQuantity(value) {
    quantity = value;
    update();
  }

  addToCart(category) async {
    cartController.addToCart(quantity, product, category);

    product = category!.products!.first;
    update();
  }

  addToFavorites(category) async {
    favoritesController.addToFavorites(product, category);

    update();
  }
}
