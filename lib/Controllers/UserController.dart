import 'package:blueuniform/DataAccesslayer/Clients/BoxStorage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Models/user.dart';
import '../main.dart';

class UserController extends GetxController {
  final BoxStorage boxClient = BoxStorage();

  final box = GetStorage();
  User? user;
  bool authed = false;
  @override
  void onInit() async {
    super.onInit();
    authed = await boxClient.getAuthState();
    if (authed) {
      user = await boxClient.getAuthedUser();
      update();
    }
    update();
  }

  Future<void> saveAuthState(User user) async {
    await boxClient.setAuthedUser(user);
    user = user;
   
    update();
    Get.offAndToNamed(AppRoute.home);
  }

  Future<void> logout() async {
    await boxClient.removeUser();
    MyApp.user = null;
    Get.toNamed(AppRoute.login);
  }
}