import 'dart:convert';

import '../Clients/OrderClient.dart';
import '../Models/order.dart';
import '../Models/user.dart';

class OrderRepo {
  OrderClient client = OrderClient();

  Future<dynamic> addOrder(
      user_id, paymentMethode, latitude, longitude, cartItems,address , total) async {
    if (await client.addOrder(user_id, paymentMethode, latitude, longitude, cartItems , address , total)) {
      
      return true;
    } else {
      return false;
    }
  } 

    Future<List<Order>> getOrders(user_id) async {
   
      var response = await client.getOrders(user_id);
      if (response != '') {
        final parsed = json.decode(response).cast<Map<String, dynamic>>();
        return parsed.map<Order>((json) => Order.fromMap(json)).toList();
      }
      return [];
    
  }
}
