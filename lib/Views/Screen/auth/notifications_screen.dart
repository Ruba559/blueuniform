import 'package:blueuniform/Constants/routes.dart';
import 'package:blueuniform/Controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';
import '../../Widgets/layouts/app-buttom-navbar.dart';
import '../../Widgets/layouts/appbar.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/list_title.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});
  NotificationController controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 1,
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                AppListTitle(text: 'notifications'.tr),
                Expanded(
                    child: GetBuilder(
                        init: controller,
                        builder: (controller) => RefreshIndicator(
                              onRefresh: () async {
                                await controller.getNoties();
                              },
                              child: controller.loadingNoties
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : controller.notifications.length == 0
                                      ? Center(
                                          child: Text(
                                            "لا توجد إشعارات",
                                            style: AppTextStyle.body,
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: false,
                                          itemCount:
                                              controller.notifications.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: radius10,
                                                    color: AppColors.white,
                                                    border: Border.all(
                                                        width: 0.8,
                                                        color: AppColors.grey)),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: InkWell(
                                                  onTap: () => {
                                                    if (controller
                                                            .notifications[
                                                                index]
                                                            .type ==
                                                        'orders')
                                                      {
                                                        Get.toNamed(
                                                            AppRoute.orders)
                                                      }
                                                    else
                                                      {
                                                        Get.toNamed(
                                                            AppRoute.home)
                                                      }
                                                  },
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              controller
                                                                  .notifications[
                                                                      index]
                                                                  .title,
                                                              style: AppTextStyle
                                                                  .body
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            Text(
                                                              controller
                                                                  .notifications[
                                                                      index]
                                                                  .subtitle,
                                                              style: AppTextStyle
                                                                  .body
                                                                  .apply(
                                                                      color: AppColors
                                                                          .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ]),
                                                ));
                                          }),
                            )))
              ],
            )));
  }
}
