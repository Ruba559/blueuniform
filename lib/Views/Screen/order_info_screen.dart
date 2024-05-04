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
               Container(
                      
                        height: 370,
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.lightgrey, borderRadius: radius10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'التفاصيل',
                                style: AppTextStyle.medium,
                              ),
                            ),
                            GetBuilder<CartController>(
                                // init: cartController,
                                builder: (controller) => Flexible(
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
                                              padding: const EdgeInsets.all(6),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    controller.cartItems[index]
                                                        .category!.name,
                                                    style: AppTextStyle.body,
                                                  ),
                                                  SizedBox(width: 15,),
                                                  Text(  "عدد ${controller.cartItems[index].quantity}",  style: AppTextStyle.body)
                                                ],
                                              ));
                                        }))),


                                       Container(
                                        alignment: Alignment.bottomRight,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              padding: const EdgeInsets.all(6),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   '  السعر الإجمالي : ' ,
                                                    style: AppTextStyle.body,
                                                  ),
                                                  SizedBox(width: 15,),
                                                  Text(  " ${controller.totalAmount.toString()} ريال سعودي",  style: AppTextStyle.title.copyWith(fontWeight: FontWeight.bold))
                                                ],
                                              ))
                          ],
                        )),
                ButtonForm(
                  text: 'المتابعة والدفع',
                  color: AppColors.secondary,
                  onPressed: () => {Get.toNamed(AppRoute.PaymentMethods)},
                )
              ],
            )));
  }
}
