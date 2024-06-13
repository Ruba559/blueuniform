import 'package:blueuniform/Controllers/CartController.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/cart.dart';
import '../DataAccesslayer/Models/category.dart';
import '../DataAccesslayer/Models/product.dart';
import '../DataAccesslayer/Repository/OrderRepo.dart';
import '../DataAccesslayer/Repository/ProductRepo.dart';
import '../Functions/check_internet.dart';
import '../main.dart';

class HomeController extends GetxController {
  ProductRepo productRepo = ProductRepo();
  OrderRepo orderRepo = OrderRepo();
  var isLoading = false.obs;

  List<Category> categories = [];
  late Product? product;

  late Category? category;

  var quantity = 1;

  bool isfav = false;




  /*  LocationController locationController = Get.put(LocationController()); */

 

  void onInit() async {
   
    isLoading.value = true;
    if (await checkInternet()) {
      categories = await productRepo.getCategories();
      isLoading.value = false;
    } else {}

    update();
    super.onInit();
  }


  getProductFromProducts(category_id) {
    print('object');
    category =
        categories.where((element) => element.id.isEqual(category_id)).first;
    product = category!.products!.first;
    Get.toNamed(AppRoute.product);

    update();
  }



 
  BoxStorage boxStorage = BoxStorage();
  logout() async {
    await boxStorage.removeUser();
    MyApp.user = null;
    Get.offAllNamed(AppRoute.login);
  }
}
