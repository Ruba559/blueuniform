import 'dart:convert';

import '../Clients/OrderClient.dart';
import '../Models/user.dart';

class OrderRepo {
  OrderClient client = OrderClient();

  Future<dynamic> addOrder(
      user_id, paymentMethode, latitude, longitude, cartItems,address) async {
    if (await client.addOrder(user_id, paymentMethode, latitude, longitude, cartItems , address)) {
      
      return true;
    } else {
      return false;
    }
  }
}
