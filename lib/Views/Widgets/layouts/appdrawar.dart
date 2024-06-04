import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Constants/routes.dart';
import '../../../Controllers/HomeController.dart';
import '../../../main.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
 //   LocaleController localeController = Get.find();
    return Drawer(
        backgroundColor: AppColors.white,
        child: ListView(children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            accountName: Text(
              MyApp.user != null ? MyApp.user!.studentName : 'Test User',
            ),
            accountEmail: Text(MyApp.user != null
                ? MyApp.user!.email
                : 'test@superteachers.agency'),
            currentAccountPicture: MyApp.user != null
                ? CircleAvatar(backgroundImage: NetworkImage(MyApp.user!.image))
                : CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.png')),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.primary,
            ),
            title: Text(
              "home".tr,
              style: AppTextStyle.body.copyWith(
                color: AppColors.primary,
              ),
            ),
            onTap: () {
              Get.toNamed(AppRoute.home);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.list,
              color: AppColors.primary,
            ),
            title: Text(
              "orders".tr,
              style: AppTextStyle.body.copyWith(color: AppColors.primary),
            ),
            onTap: () {
              Get.toNamed(AppRoute.orders);
            },
          ),
      ListTile(
            leading: Icon(
              Icons.person,
              color: AppColors.primary,
            ),
            title: Text(
              "profile".tr,
              style: AppTextStyle.body.copyWith(color: AppColors.primary),
            ),
            onTap: () {
              Get.toNamed(AppRoute.profile);
            },
          ),
 
          ListTile(
            leading: Icon(
              Icons.language,
              color: AppColors.primary,
            ),
            title: Text(
              "switch_locale".tr,
              style: AppTextStyle.body.copyWith(color: AppColors.primary),
            ),
            onTap: () {
              if (Get.locale == Locale('ar')) {
                Get.updateLocale(Locale('en'));
              } else {
                Get.updateLocale(Locale('ar'));
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text(
              "logout".tr,
              style: AppTextStyle.body.copyWith(color: AppColors.primary),
            ),
            onTap: () {
              controller.logout();
            },
          ),
          /* Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    child: Text(
                      'en',
                      style: AppTextStyle.small,
                    ),
                    onTap: () {
                      localeController.changeLang('en');
                      Navigator.of(context).pop();
                    }),
                InkWell(
                    child: Text(
                      'ar',
                      style: AppTextStyle.small,
                    ),
                    onTap: () {
                      localeController.changeLang('ar');
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ), */
        ]));
  }
}
