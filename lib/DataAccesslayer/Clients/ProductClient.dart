import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class ProductClient {
  var client = http.Client();

  ProductClient();

  Future<dynamic> getCategories() async {
    var response = await client.get(Uri.parse(baseUrl + categories));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
