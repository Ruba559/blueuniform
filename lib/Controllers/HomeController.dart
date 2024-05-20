import 'package:blueuniform/Controllers/CartController.dart';
import 'package:blueuniform/Controllers/FavoritesController.dart';
import 'package:blueuniform/Controllers/LocationController.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/cart.dart';
import '../DataAccesslayer/Models/category.dart';
import '../DataAccesslayer/Models/product.dart';
import '../DataAccesslayer/Repository/OrderRepo.dart';
import '../DataAccesslayer/Repository/ProductRepo.dart';
import '../Functions/check_internet.dart';
import '../Views/Widgets/snackbar.dart';
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

  var paymentMethode = 'sadad';

  CartController cartController = CartController();

  FavoritesController favoritesController = FavoritesController();

  LocationController locationController = LocationController();

  late TextEditingController address;

  void onInit() async {
    address = TextEditingController();
    isLoading.value = true;
    if (await checkInternet()) {
      categories = await productRepo.getCategories();
      isLoading.value = false;
    } else {}

    update();
    super.onInit();
  }

  getProduct(value) {
    category = value;
    product = category!.products!.first;
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
    update();
  }

  addToFavorites(category) async {
    favoritesController.addToFavorites(product, category);
    isfav = true;
    update();
  }

  getPosition() async {
    if (await locationController.checkLocationServiceEnabled()) {
      Get.toNamed(AppRoute.position);
    } else {
      SnackBars.showWarning('يرجى تفعيل الموقع');
    }
  }

  final position = Rx<Position?>(null);
  getOrderInfo(value) {
    position.value = value;

    Get.toNamed(AppRoute.orderInfo);
  }

  List<Map<String, dynamic>> cartItems = [];

  void getCartItemsMap() {
    cartItems.clear();
    for (Cart item in cartController.cartItems) {
      cartItems.add({
        'quantity': item.quantity,
        'category': item.category!.id,
        'product': item.product!.id,
      });
    }
  }

  addOrder() async {
    print(address.text);
    isLoading.value = true;
    getCartItemsMap();
    await orderRepo.addOrder(
        MyApp.user!.id,
        paymentMethode,
        position.value!.latitude,
        position.value!.longitude,
        cartItems,
        address.text);
    isLoading.value = false;
    cartController.clearCart();
    Get.offNamed(AppRoute.orderComplate);
  }

  selectPaymentMethode(value) {
    paymentMethode = value;
    update();
  }

  BoxStorage boxStorage = BoxStorage();
  logout() async {
    await boxStorage.removeUser();
    MyApp.user = null;
    Get.offAllNamed(AppRoute.login);
  }
}
