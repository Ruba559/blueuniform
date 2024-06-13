import 'package:blueuniform/Controllers/CartController.dart';
import 'package:blueuniform/Controllers/FavoritesController.dart';
import 'package:blueuniform/DataAccesslayer/Models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../DataAccesslayer/Models/category.dart';

class ProductScreenController extends GetxController {
  Category category;
  int quantity = 1;
  ProductScreenController({required this.category});
  late Product? selectedProduct;
  List<DropdownMenuItem<Product>> productList = [];
  CartController cartController = Get.find();
  FavoritesController favoritesController = Get.find();

  bool inFavorite = false;

  @override
  void onInit() {
    selectedProduct = category.products.first;
    print(category.name);
    productList = category.products
        .map((Product item) =>
            DropdownMenuItem<Product>(value: item, child: Text(item.size)))
        .toList();
    print(productList);
    inFavorite =
        favoritesController.getItemIndex(category.id) != null ? true : false;
    update();
    super.onInit();
  }

  selectQuantity(value) {
    quantity = value;
    update();
  }

  selectSize(value) {
    selectedProduct = value;
    update();
  }

  void addToCart() {
    cartController.addToCart(quantity, category, selectedProduct);
  }

  void addToFavorite() {
    print("adding to favorite");
    inFavorite = !inFavorite;
    update();
    favoritesController.addToFavorites(category);
  }

  @override
  void onClose() {
    productList = [];
    update();
    super.onClose();
  }
}
