import 'package:blueuniform/Constants/app_color.dart';
import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Constants/routes.dart';
import '../../../main.dart';

class AppButtomNavBar extends StatelessWidget {
  final int selectedIndex;
  AppButtomNavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.grey.withOpacity(.5),
      elevation: 0,
      currentIndex: this.selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextStyle.small.apply(color: AppColors.secondary),
      unselectedLabelStyle: AppTextStyle.small.apply(fontSizeFactor: .8),
      onTap: ((value) {
        MyApp.bottomSelectedItem = value;
        switch (value) {
          case 0:
            Get.toNamed(AppRoute.home);
            break;

          case 1:
            Get.toNamed(AppRoute.notifications);
            break;

          case 2:
            Get.toNamed(AppRoute.cart);
            break;

          case 3:
            Get.toNamed(AppRoute.favorites);
            break;
        }
      }),
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.house,
              size: 24,
            ),
          ),
          label: 'home'.tr,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.bell,
              size: 24,
            ),
          ),
          label: 'notifications'.tr,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              Icons.shopping_cart,
              size: 24,
            ),
          ),
          label: 'shopping_cart'.tr,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              Icons.favorite,
              size: 24,
            ),
          ),
          label: "favorite".tr,
        ),
      ],
    );
  }
}
