import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/app_color.dart';
import '../../Widgets/layouts/app-buttom-navbar.dart';
import '../../Widgets/layouts/appbar.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/list_title.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});
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
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppListTitle(text: 'contactus'.tr),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.call,
                        color: AppColors.secondary,
                      ),
                      title: Text(
                        "هاتف",
                        style: AppTextStyle.body,
                      ),
                      subtitle: Text(
                        "920006685",
                        style: AppTextStyle.mediumBold,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email, color: AppColors.secondary),
                      title: Text(
                        "البريد الإلكتروني",
                        style: AppTextStyle.body,
                      ),
                      subtitle: Text(
                        "info@ibnroshd.edu.sa",
                        style: AppTextStyle.mediumBold,
                      ),
                    ),
                    /*شركة ابن رشد التعليمية القابضة


 */
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "شركة ابن رشد التعليمية القابضة",
                        style: AppTextStyle.bodyBold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "سجل تجاري : 1010430899",
                        style: AppTextStyle.body,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "رقم ضريبي : 310446934500003",
                        style: AppTextStyle.body,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "الرياض - حي اليرموك - شارع اللواء",
                        style: AppTextStyle.body,
                      ),
                    ),
                  ],
                ))
              ],
            )));
  }
}
