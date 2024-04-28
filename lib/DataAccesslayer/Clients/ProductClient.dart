import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class ProductClient {
  var client = http.Client();

  ProductClient();

  Future<dynamic> getSchools() async {
    var response = await client.get(Uri.parse(baseUrl + schools));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }


}
