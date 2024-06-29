import 'dart:convert';

import '../Clients/UserClient.dart';
import '../Models/notifications.dart';
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

  Future<dynamic> updateProfile(id, email, name, password, image) async {
    if (await client.UpdateProfile(id, email, name, password, image) != '') {
      print('object');
      var response =
          await client.UpdateProfile(id, email, name, password, image);

      return User.fromJson(response);
    } else {
      return '';
    }
  }

  Future<List<BackNotification>> getNoties(userId) async {
    var response = await client.getNoties(userId);
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<BackNotification>((json) => BackNotification.fromMap(json))
          .toList();
    }
    return [];
  }
}
