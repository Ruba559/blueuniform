import 'package:blueuniform/Constants/routes.dart';
import 'package:blueuniform/Controllers/HomeController.dart';
import 'package:blueuniform/DataAccesslayer/Models/category.dart';
import 'package:blueuniform/DataAccesslayer/Repository/OrderRepo.dart';
import 'package:blueuniform/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  LatLng? position;
  var paymentMethode = 'sadad';
  TextEditingController address = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    await getCartItemsFromStorage();
  }

  Future<void> getCartItemsFromStorage() async {
    cartItems = await boxClient.getCartItems();
    print('getCartItemsFromStorage');
    print(cartItems);
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
        print(cartItems);
      } else {
        cartItems[index!].quantity = cartItems[index!].quantity - 1;
      }
    }

    update();
  }

  num getTotalAmount() {
    num total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  Future<void> clearCart() async {
    print('cleeer');
    cartItems.clear();
    await syncCart();
    orderCartItems = [];
    print(orderCartItems);
  }

  List<Map<String, dynamic>> orderCartItems = [];

  void getCartItemsMap() {
    for (Cart item in cartItems) {
      orderCartItems.add({
        'quantity': item.quantity,
        'product_id': item.productId,
        'category_id': item.categoryId,
        'price': item.price,
        'total': item.price * item.quantity,
        'orderId': item.orderId,
      });
    }
    //cartItems.clear();
  }

  updatePosition(LatLng value) {
    position = value;
    print(position);
    update();
  }

  getAddress() {
    Get.toNamed(AppRoute.getAddress);
  }

  selectPaymentMethode(value) {
    paymentMethode = value;
    update();
  }

  addOrder() async {
    print('cartItems');
    print(cartItems);
    sendingOrder = true;
    update();
    try {
      getCartItemsMap();
      await orderRepo.addOrder(
          MyApp.user!.id,
          paymentMethode,
          position!.latitude,
          position!.longitude,
          orderCartItems,
          address.text,
          getTotalAmount());
      sendingOrder = false;
      await clearCart();
      update();
      Get.offNamed(AppRoute.orderComplate);
    } catch (e) {
      sendingOrder = false;
      update();
    }
  }
}
