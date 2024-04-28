
import 'dart:convert';

import '../Clients/UserClient.dart';
import '../Models/user.dart';

class UserRepo {
  UserClient client = UserClient();



 

  Future<dynamic> login(email, password) async {
    if (await client.Login(email, password) != '') {
      var response = await client.Login(email, password);
      return User.fromJson(response);
    } else {
      return '';
    }
  }

Future<dynamic> updateProfile(id, name, email, password , image ) async {
      if (await client.UpdateProfile(id, name, email, password , image ) != '') {

    var response = await client.UpdateProfile(id, name, email, password , image);
   
       return User.fromJson(response);
    } else {
      return '';
    }
  }


  
}
