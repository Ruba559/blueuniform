import 'package:blueuniform/Constants/routes.dart';
import 'package:blueuniform/Controllers/HomeController.dart';
import 'package:blueuniform/DataAccesslayer/Models/category.dart';
import 'package:blueuniform/DataAccesslayer/Repository/OrderRepo.dart';
import 'package:blueuniform/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/cart.dart';
import '../Views/Widgets/snackbar.dart';

class CartController extends GetxController {
  List<Cart> cartItems = [];

  BoxClient boxClient = BoxClient();

  late num totalAmount = 0;

  int quantity = 0;
  final HomeController homeController = Get.find();

  bool sendingOrder = false;

  OrderRepo orderRepo = OrderRepo();

  final position = Rx<Position?>(null);
  var paymentMethode = 'sadad';
  TextEditingController address = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    await getCartItemsFromStorage();
  }

  Future<void> getCartItemsFromStorage() async {
    cartItems = await boxClient.getCartItems();
  }

  Category categoryFromId(id) {
    return homeController.categories
        .where((element) => element.id == id)
        .toList()
        .first;
  }

  addToCart(quantity, category, product) async {
    var cartItemIndex = getCartItemIndex(product.id, category.id);
    if (cartItemIndex == null) {
      var cartItem = Cart(
        quantity: quantity,
        name: category.name,
        image: category.image,
        price: category.price,
        productId: product.id,
        categoryId: category.id,
        orderId: 0,
      );
      cartItems.add(cartItem);
      await syncCart();

      SnackBars.showSuccess('add_to_cart'.tr);
      update();
    } else {
      SnackBars.showWarning('already_added'.tr);
    }
  }

  Future<void> syncCart() async {
    await boxClient.addToCart(cartItems);
  }

  Future<void> syncCartUpdate(value) async {
    await boxClient.addToCart(value);
  }

  int? getCartItemIndex(product_id, category_id) {
    for (var index = 0; index < cartItems.length; index++) {
      if (cartItems[index].productId == product_id &&
          cartItems[index].categoryId == category_id) {
        return index;
      }
    }
    return null;
  }

  Future<void> updateQuantity(index, type) async {
    if (type == 'plus') {
      cartItems[index!].quantity = cartItems[index!].quantity + 1;
    }
    if (type == 'minus') {
      if (cartItems[index!].quantity <= 1) {
        cartItems.removeAt(index);
        await syncCart();
      } else {
        cartItems[index!].quantity = cartItems[index!].quantity - 1;
      }
    }

    update();
  }

  num getTotalAmount() {
    num total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }

  Future<void> clearCart() async {
    cartItems.clear();
    await syncCart();
  }

  List<Map<String, dynamic>> orderCartItems = [];

  void getCartItemsMap() {
    cartItems.clear();
    for (Cart item in cartItems) {
      orderCartItems.add({
        'quantity': item.quantity,
        'product_id': item.productId,
        'price': item.price,
        'total': item.price * item.quantity,
      });
    }
  }

  getAddress(value) {
    position.value = value;
    print(position.value);
    Get.toNamed(AppRoute.getAddress);
  }

  selectPaymentMethode(value) {
    paymentMethode = value;
    update();
  }

  addOrder() async {
    sendingOrder = true;
    update();
    getCartItemsMap();
    await orderRepo.addOrder(
        MyApp.user!.id,
        paymentMethode,
        position.value!.latitude,
        position.value!.longitude,
        cartItems,
        address.text,
        getTotalAmount());
    sendingOrder = false;
    clearCart();
    update();
    Get.offNamed(AppRoute.orderComplate);
  }
}
