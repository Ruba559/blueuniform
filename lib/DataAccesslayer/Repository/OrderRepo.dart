import 'dart:convert';

import '../Clients/OrderClient.dart';
import '../Models/user.dart';

class OrderRepo {
  OrderClient client = OrderClient();

  Future<dynamic> addOrder(
      user_id, paymentMethode, latitude, longitude, cartItems) async {
    if (await client.addOrder(user_id, paymentMethode, latitude, longitude, cartItems)) {
      var response = await client.addOrder(user_id, paymentMethode, latitude, longitude, cartItems);

      return true;
    } else {
      return false;
    }
  }
}
