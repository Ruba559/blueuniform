import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';

class SplashController extends GetxController
   
    with
        // ignore: deprecated_member_use
        SingleGetTickerProviderMixin {
  Future<void> checkAuthed() async {
    // bool authed = await boxClient.getAuthState();
    // if (authed == true) {
    //   MyApp.appUser = await boxClient.getAuthedUser();
    //   Future.delayed(const Duration(seconds: 3))
    //       .then((value) => Get.offAndToNamed(AppRoutes.homeScreen));
    // } else {
    //   Future.delayed(const Duration(seconds: 3))
    //       .then((value) => Get.offAndToNamed(AppRoutes.otpRegisterScreen));
    // }

    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offAndToNamed(AppRoute.login));
  }

  void onInit() async {
    await checkAuthed();
    super.onInit();
  }
}
