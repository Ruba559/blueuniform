import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Repository/ProductRepo.dart';

class HomeController extends GetxController {

  ProductRepo productRepo = ProductRepo();

  void onInit() {
  
    super.onInit();
  }


getProduct()
{
   Get.toNamed(AppRoute.product);
}

}