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

  void onInit() async {
    isLoading.value = true;
    categories = await productRepo.getCategories();
    isLoading.value = false;

    update();
    super.onInit();
  }

  // getProduct(category) {
  //   category = category;
  //   //product = category!.products!.first;

  //   update();

  //   Get.toNamed(AppRoute.product );
  // }

  BoxStorage boxStorage = BoxStorage();
  logout() async {
    await boxStorage.removeUser();
    MyApp.user = null;
    Get.offAllNamed(AppRoute.login);
  }
}
