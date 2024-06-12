import 'package:blueuniform/main.dart';
import 'package:get/get.dart';

import '../DataAccesslayer/Models/order.dart';
import '../DataAccesslayer/Repository/OrderRepo.dart';
import '../Functions/check_internet.dart';

class OrderController extends GetxController {
  List<Order> orderItems = [];
  var isLoading = false.obs;

  OrderRepo orderRepo = OrderRepo();

  void onInit() async {
    isLoading.value = true;
    if (await checkInternet()) {
      orderItems = await orderRepo.getOrders(MyApp.user!.id);
      isLoading.value = false;
    } else {}
    print(orderItems);
    update();
    super.onInit();
  }
}
