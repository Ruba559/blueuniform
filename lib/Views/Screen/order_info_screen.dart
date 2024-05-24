import 'package:blueuniform/Constants/app_style.dart';
import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';
import '../../Constants/app_color.dart';
import '../../Constants/routes.dart';
import '../../Controllers/CartController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';
import 'package:get/get.dart';

class OrderInfoScreen extends StatelessWidget {
  OrderInfoScreen({super.key});

  CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.calc();
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
                AppListTitle(text: 'معلومات الطلب'),
                Flexible(
                    child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.lightgrey, borderRadius: radius10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'details'.tr,
                                style: AppTextStyle.medium,
                              ),
                            ),
                            GetBuilder<CartController>(
                                builder: (controller) => Expanded(
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
                                                    controller.cartItems[index]
                                                        .name,
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
                            Expanded(
                                flex: 1,
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    padding: const EdgeInsets.all(6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'total'.tr,
                                          style: AppTextStyle.body,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                       
                                        Text(
                                            " ${controller.totalAmount.toString()} ريال سعودي",
                                            style: AppTextStyle.title.copyWith(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )))
                          ],
                        ))),
                ButtonForm(
                  text: 'continue_and_payment'.tr,
                  color: AppColors.secondary,
                  onPressed: () => {Get.toNamed(AppRoute.PaymentMethods)},
                )
              ],
            )));
  }
}
