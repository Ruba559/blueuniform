import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/routes.dart';
import '../../../main.dart';

PreferredSize AppAppBar() {
  return PreferredSize(
      preferredSize: Size(Get.width, 60),
      child: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppColors.white,
        elevation: 1,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
        ),
        title: Padding(
            padding: EdgeInsets.all(7),
            child:
             Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
            ),
        actions: [
        InkWell(
          onTap: () => {
            Get.toNamed(AppRoute.profile)
          },
          child:Container(
            width: 45,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.secondary, width: 1),
                borderRadius: radius50,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child:  MyApp.user != null ? Image.network(
               MyApp.user!.image ,
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.fill,
                ): Image.asset('assets/images/logo.png'),
              )))   
        ],
      ));
}
