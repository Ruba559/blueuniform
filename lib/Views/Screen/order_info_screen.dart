import 'package:blueuniform/Constants/app_style.dart';
import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../Controllers/CartController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';

class OrderInfoScreen extends StatelessWidget {
  OrderInfoScreen({super.key});

  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    //controller.calc();
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 0,
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppListTitle(text: 'order_info'.tr),
                Flexible(
                    child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.lightgrey, borderRadius: radius10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'details'.tr,
                              style: AppTextStyle.medium,
                            ),
                            GetBuilder(
                                init: controller,
                                builder: (_) => Expanded(
                                    flex: 3,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.cartItems.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    controller
                                                        .cartItems[index].name,
                                                    style: AppTextStyle.body,
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                      "${'number'.tr} ${controller.cartItems[index].quantity}",
                                                      style: AppTextStyle.body)
                                                ],
                                              ));
                                        }))),
                            Container(
                                padding: const EdgeInsets.all(6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'total'.tr,
                                      style: AppTextStyle.body,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                        " ${controller.getTotalAmount()} ريال سعودي",
                                        style: AppTextStyle.title.copyWith(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ))
                          ],
                        ))),
                GetBuilder(
                    init: controller,
                    builder: (context) {
                      return ButtonForm(
                        text: 'send_order'.tr,
                        color: AppColors.secondary,
                        onPressed: () => {controller.addOrder()},
                        isLoading: controller.sendingOrder,
                      );
                    })
              ],
            )));
  }
}
