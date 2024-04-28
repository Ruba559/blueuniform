import 'dart:convert';

import '../Clients/ProductClient.dart';
import '../Clients/RegisterClient.dart';

class ProductRepo {
  ProductClient client = ProductClient();

  // Future<List<Product>> getSchools() async {
  //   var response = await client.getSchools();
  //   if (response != '') {
  //     final parsed = json.decode(response).cast<Map<String, dynamic>>();
  //     return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  //   }
  //   return [];
  // }

 
}
