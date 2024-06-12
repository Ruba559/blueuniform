import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';

class SplashScreen2 extends StatelessWidget {
  SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: Get.width / 2,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
