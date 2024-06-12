import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class UserClient {
  var client = http.Client();

  UserClient();

  

  Future<dynamic> Login(email, password) async {
    var url = Uri.parse(baseUrl + login);

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }


  Future<dynamic> UpdateProfile(id, email,name , password, image) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + updateProfile));

    request.fields.addAll({
      'id': id.toString(),
      'email': email.toString(),
       'name': name.toString(),
      'password': password.toString(),
    });
    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('avatar', image));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      return response.stream.bytesToString();
    } else {
      return '';
    }
  }

  
}
