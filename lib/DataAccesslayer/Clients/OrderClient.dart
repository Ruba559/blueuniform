import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class OrderClient {
  var client = http.Client();

  OrderClient();

  Future<dynamic> addOrder(user_id, paymentMethode, latitude, longitude,
      cartItems, address, total) async {
    var url = Uri.parse(baseUrl + order);
    print('start send order');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': user_id,
        'paymentMethode': paymentMethode,
        'latitude': latitude,
        'longitude': longitude,
        'cartItems': cartItems,
        'address': address,
        'total': total,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> getOrders(user_id) async {
    var response = await client.get(Uri.parse(baseUrl + orders + "/$user_id"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
