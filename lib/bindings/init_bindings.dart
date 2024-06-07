import 'package:get/get.dart';

import '../Controllers/CartController.dart';
import '../Controllers/FavoritesController.dart';
import '../Controllers/HomeController.dart';
import '../Controllers/userController.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<UserController>(UserController());

    Get.put<CartController>(CartController());
    Get.put<FavoritesController>(FavoritesController());
    Get.put<HomeController>(HomeController());
    //Get.put<LanguageController>(LanguageController());
  }
}