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
        child: Column(
          children: [
            Expanded(
              child: ListView(shrinkWrap: true, children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                  ),
                  accountName: Text(
                    MyApp.user != null ? MyApp.user!.studentName : 'Test User',
                    style: AppTextStyle.body.copyWith(color: Colors.white),
                  ),
                  accountEmail: Text(MyApp.user != null
                      ? MyApp.user!.email
                      : 'test@superteachers.agency'),
                  currentAccountPicture: MyApp.user != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(MyApp.user!.image))
                      : CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/logo.png')),
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
                    Icons.favorite,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    "favorite".tr,
                    style: AppTextStyle.body.copyWith(color: AppColors.primary),
                  ),
                  onTap: () {
                    Get.toNamed(AppRoute.favorites);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.question_answer,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    "privacy".tr,
                    style: AppTextStyle.body.copyWith(color: AppColors.primary),
                  ),
                  onTap: () {
                    Get.toNamed(AppRoute.privacy);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    "terms".tr,
                    style: AppTextStyle.body.copyWith(color: AppColors.primary),
                  ),
                  onTap: () {
                    Get.toNamed(AppRoute.terms);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    "about".tr,
                    style: AppTextStyle.body.copyWith(color: AppColors.primary),
                  ),
                  onTap: () {
                    Get.toNamed(AppRoute.about);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.call,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    "contactus".tr,
                    style: AppTextStyle.body.copyWith(color: AppColors.primary),
                  ),
                  onTap: () {
                    Get.toNamed(AppRoute.contactus);
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
              ]),
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
          ],
        ));
  }
}
