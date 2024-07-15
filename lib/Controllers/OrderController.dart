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
  bool isLoading = false;

  OrderRepo orderRepo = OrderRepo();

  CartController cartController = Get.find();

  void onInit() async {
    await getOrders();
    super.onInit();
  }

  Future<void> getOrders() async {
    isLoading = true;
    update();
    if (await checkInternet()) {
      print("start get orders");
      orderItems = await orderRepo.getOrders(MyApp.user!.id);
      print(orderItems);
      update();
      isLoading = false;
      update();
    } else {
      isLoading = false;
    }
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
          productId: item.product.id,
          categoryId: item.category.id,
          orderId: order.id);
      cartItems.add(cartItem);
    }
    print(cartItems.length);
    await cartController.syncCartUpdate(cartItems);
    await cartController.getCartItemsFromStorage();

    print(cartItems);
    Get.toNamed(AppRoute.cart);
  }
}
