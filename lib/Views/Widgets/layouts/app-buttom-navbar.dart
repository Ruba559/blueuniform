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
      //  selectedLabelStyle: UITextStyle.xsmall,
      //unselectedLabelStyle: UITextStyle.xsmall,
      backgroundColor: AppColors.primary,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white.withOpacity(.5),
      currentIndex: this.selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextStyle.small,
      unselectedLabelStyle: AppTextStyle.small.apply(fontSizeFactor: .8),
      onTap: ((value) {
        MyApp.bottomSelectedItem = value;
        switch (value) {
          case 0:
            Get.toNamed(AppRoute.home);
            break;

          case 1:
            //  Get.toNamed(AppRoute.notifications);
            break;

          case 2:
            //  Get.toNamed(AppRoute.files);
            break;

          case 3:
            //    Get.toNamed(AppRoute.settings);
            break;
          case 4:
            //    Get.toNamed(AppRoute.settings);
            break;
        }
      }),
      items: [
         const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.house,
              size: 24,
            ),
          ),
          label: 'الرئيسية',
        ),
          const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.cartShopping,
              size: 24,
            ),
          ),
          label: 'سلة الشراء',
        ),
         const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.heart,
              size: 24,
            ),
          ),
          label: 'المفضلة',
        ),
        const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              Icons.settings,
              size: 24,
            ),
          ),
          label: 'الإعدادات',
        ),
      ],
    );
  }
}
