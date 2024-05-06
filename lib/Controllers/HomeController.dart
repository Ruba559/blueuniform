import 'package:blueuniform/Controllers/CartController.dart';
import 'package:blueuniform/Controllers/FavoritesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/category.dart';
import '../DataAccesslayer/Models/product.dart';
import '../DataAccesslayer/Repository/ProductRepo.dart';
import '../main.dart';

class HomeController extends GetxController {
  ProductRepo productRepo = ProductRepo();

  var isLoading = false.obs;

  List<Category> categories = [];
  late Product? product;

  late Category? category;

  var quantity = 1;

  bool isfav = false;

  CartController cartController = CartController();

  FavoritesController favoritesController = FavoritesController();

  void onInit() async {
    isLoading.value = true;
    categories = await productRepo.getCategories();

    isLoading.value = false;

    update();
    super.onInit();
  }

  getProduct(value) {
    category = value;
    product = category!.products!.first;

    // for (var i = 0; i < favoritesController.favoriteItems.length; i++) {
    //   if (favoritesController.favoriteItems[i].category!.id != category!.id) {
    //     isfav = false;
    //   } else {
    //     isfav = true;
    //   }
    // }

    Get.toNamed(AppRoute.product);

    update();
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

    // product = category!.products!.first;
    update();
  }

  addToFavorites(category) async {
    favoritesController.addToFavorites(product, category);
    isfav = true;
    update();
  }

  BoxStorage boxStorage = BoxStorage();
  logout() async {
    await boxStorage.removeUser();
    MyApp.user = null;
    Get.offAllNamed(AppRoute.login);
  }
}
