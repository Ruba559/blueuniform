import 'dart:convert';

import '../../Functions/check_internet.dart';
import '../Clients/ProductClient.dart';
import '../Models/category.dart';

class ProductRepo {
  ProductClient client = ProductClient();

  Future<List<Category>> getCategories() async {
   
      var response = await client.getCategories();
      if (response != '') {
        final parsed = json.decode(response).cast<Map<String, dynamic>>();
        return parsed.map<Category>((json) => Category.fromMap(json)).toList();
      }
      return [];
    
  }
}
