import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class OrderClient {
  var client = http.Client();

  OrderClient();



    Future<dynamic> addOrder(user_id, paymentMethode, latitude, longitude, cartItems) async {
    var url = Uri.parse(baseUrl + order);

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
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
}
