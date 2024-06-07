import 'dart:ffi';

import 'package:blueuniform/Constants/routes.dart';
import 'package:blueuniform/Controllers/CartController.dart';
import 'package:blueuniform/main.dart';
import 'package:get/get.dart';

import '../DataAccesslayer/Models/cart.dart';
import '../DataAccesslayer/Models/order.dart';
import '../DataAccesslayer/Repository/OrderRepo.dart';
import '../Functions/check_internet.dart';

class OrderController extends GetxController {
  List<Order> orderItems = [];
  var isLoading = false.obs;

  OrderRepo orderRepo = OrderRepo();

  CartController cartController = Get.find();

  void onInit() async {
    isLoading.value = true;
    if (await checkInternet()) {
      orderItems = await orderRepo.getOrders(MyApp.user!.id);
      update();
      isLoading.value = false;
    } else {}
    super.onInit();
  }

  List<Cart> cartItems = [];

  updateOrder(order) async {
    await cartController.clearCart();
    cartItems.clear();
    for (dynamic item in order.orderDetails) {
      var cartItem = Cart(
        quantity: item.quantity,
        name: item.category.name,
        image: item.category.image,
        price: item.category.price,
        productId: item.product_id,
        categoryId: item.category.id,
      );
      cartItems.add(cartItem);
    }

    await cartController.syncCartUpdate(cartItems);
    await cartController.getCartItemsFromStorage();

    print(cartItems);
    Get.toNamed(AppRoute.cart);
  }
}
