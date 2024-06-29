import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class LegalsCleint {
  var client = http.Client();

  LegalsCleint();

  Future<dynamic> getPrivacy() async {
    var response = await client.get(Uri.parse(baseUrl + privacy));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
  Future<dynamic> getTerms() async {
    var response = await client.get(Uri.parse(baseUrl + terms));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
  Future<dynamic> getAbout() async {
    var response = await client.get(Uri.parse(baseUrl + about));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
