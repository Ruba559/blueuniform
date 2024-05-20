import 'package:blueuniform/Controllers/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../main.dart';

class SplashController extends GetxController
   {

      UserController userController = Get.find();
  //   with
  //       // ignore: deprecated_member_use
  //       SingleGetTickerProviderMixin {
  // Future<void> checkAuthed() async {
  //   // bool authed = await boxClient.getAuthState();
  //   // if (authed == true) {
  //   //   MyApp.appUser = await boxClient.getAuthedUser();
  //   //   Future.delayed(const Duration(seconds: 3))
  //   //       .then((value) => Get.offAndToNamed(AppRoutes.homeScreen));
  //   // } else {
  //   //   Future.delayed(const Duration(seconds: 3))
  //   //       .then((value) => Get.offAndToNamed(AppRoutes.otpRegisterScreen));
  //   // }

  //   Future.delayed(const Duration(seconds: 3))
  //       .then((value) => Get.offAndToNamed(AppRoute.splashScreen2));
  //         Future.delayed(const Duration(seconds: 6))
  //       .then((value) => Get.offAndToNamed(AppRoute.login ));
  // }

  // void onInit() async {
  //   await checkAuthed();
  //   super.onInit();
  // }
  BoxStorage boxStorage = BoxStorage();
   @override
   
  void onReady() {
    if (userController.authed == true) {
      if (userController.user != null) {
        MyApp.user = userController.user;
      }
  Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.toNamed(AppRoute.splashScreen2));
      ;
      Future.delayed(const Duration(seconds: 6))
          .then((value) => Get.toNamed(AppRoute.home));
      ;
    } else {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.toNamed(AppRoute.login));
    }
    super.onReady();
  }
}
