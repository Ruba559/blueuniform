import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:blueuniform/Views/Widgets/payment_method_item.dart';
import 'package:flutter/material.dart';
import '../../Constants/app_color.dart';
import '../../Controllers/HomeController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';
import 'package:get/get.dart';

class PaymentMethodsScreen extends StatelessWidget {
  PaymentMethodsScreen({super.key});
  @override
  HomeController homeController = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(),
      bottomNavigationBar: AppButtomNavBar(
        selectedIndex: 0,
      ),
      drawer: AppDrawer(),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:   GetBuilder<HomeController>(
                    builder: (controller) =>Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppListTitle(text: "available_payment_methods".tr),
               Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.topRight,
                              child: Text(
                                'how_payment'.tr,
                                style: AppTextStyle.body,
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  {controller.selectPaymentMethode('sadad')},
                              child: PaymentMethodItem(
                                text: "payment_sadad".tr,
                                image: 'assets/images/sadad.png',
                                color: controller.paymentMethode == 'sadad'
                                    ? AppColors.secondary
                                    : AppColors.lightgrey,
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  {controller.selectPaymentMethode('visa')},
                              child: PaymentMethodItem(
                                text: "payment_by_payment_card".tr,
                                image: 'assets/images/visa.png',
                                color: controller.paymentMethode == 'visa'
                                    ? AppColors.secondary
                                    : AppColors.lightgrey,
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  {controller.selectPaymentMethode('pay')},
                              child: PaymentMethodItem(
                                text: "payment_apple".tr,
                                image: 'assets/images/pay.png',
                                color: controller.paymentMethode == 'pay'
                                    ? AppColors.secondary
                                    : AppColors.lightgrey,
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  {controller.selectPaymentMethode('paypal')},
                              child: PaymentMethodItem(
                                text: "payment_PayPal".tr,
                                image: 'assets/images/paypal.png',
                                color: controller.paymentMethode == 'paypal'
                                    ? AppColors.secondary
                                    : AppColors.lightgrey,
                              ),
                            ),
                          ],
                        ),
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return ButtonForm(
                      text: "pay_order_value".tr,
                      color: AppColors.secondary,
                      onPressed: () => {homeController.addOrder()},
                      isLoading: controller.isLoading.value);
                }),
              ],
            ),
          )),
    ));
  }
}
