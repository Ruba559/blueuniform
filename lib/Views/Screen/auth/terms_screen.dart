import 'package:blueuniform/Controllers/legal_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';

import '../../Widgets/layouts/app-buttom-navbar.dart';
import '../../Widgets/layouts/appbar.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/list_title.dart';

final LegalController controller = Get.find();

class TermsScreen extends StatelessWidget {
  TermsScreen({super.key});
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppListTitle(text: "سياسة الإرجاع والتبديل"),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: GetBuilder(
                          init: controller,
                          builder: (context) {
                            return /* HtmlWidget(
                              controller.privacy,
                              textStyle: TextStyle(fontFamily: "Cairo"),
                            ); */
                                Html(
                              data: controller.terms,
                              style: {
                                "body": Style(fontFamily: "Cairo"),
                                "strong": Style(color: AppColors.secondary)
                              },
                            );
                          })),
                )
              ],
            )));
  }
}
