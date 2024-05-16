import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';
import '../../Constants/app_color.dart';
import '../../Constants/routes.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import 'package:get/get.dart';

import '../Widgets/layouts/appdrawar.dart';

class OrderComplateScreen extends StatelessWidget {
  OrderComplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 0,
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 1,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(80))),
                        child: Icon(
                          Icons.done_all,
                          size: 100,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "request_sent".tr,
                        style: AppTextStyle.medium,
                      ),
                    ],
                  ),
                  ButtonForm(
                    text: "back_to_home".tr,
                    color: AppColors.secondary,
                    onPressed: () => {Get.toNamed(AppRoute.home)},
                  )
                ])));
  }
}
