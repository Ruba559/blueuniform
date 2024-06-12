import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/app_text_style.dart';
import '../../Controllers/CartController.dart';
import '../../Controllers/HomeController.dart';
import '../../Controllers/LocationController.dart';
import '../../Controllers/OrderController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  CartController cartController = Get.find();
  HomeController hometController = Get.find();
  OrderController orderController = Get.put(OrderController());
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
              children: [
                AppListTitle(text: 'orders'.tr),
                Expanded(
                    child: GetBuilder<OrderController>(
                        init: orderController,
                        builder:
                            (controller) => Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  controller.orderItems.length,
                                              scrollDirection: Axis.vertical,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index ) {
                                                return Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: radius10,
                                                        color: AppColors.white,
                                                        border: Border.all(
                                                            width: 0.8,
                                                            color: AppColors
                                                                .grey)),
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 8),
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    child: InkWell(
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                               decoration: BoxDecoration(
                                                        borderRadius: radius10,
                                                        color: AppColors.secondary,
                                                        border: Border.all(
                                                            width: 0.8,
                                                            color: AppColors
                                                                .grey)),
                                                                padding: EdgeInsets.all(10),
                                                              margin: EdgeInsets.all(5),
                                                                child:
                                                                   Text('# $index' , style: AppTextStyle.body.copyWith(color: AppColors.white),)),
                                                                   SizedBox(width: 30,),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(controller.orderItems[index].totalPrice.toString(),
                                                                      style: AppTextStyle
                                                                          .body
                                                                          .copyWith(
                                                                              fontWeight: FontWeight.bold),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),

                                                                    Text(controller.orderItems[index].status == 0? 'قيد الانتظار' : 'تم الطلب'),
                                                              
                                                              ],
                                                            ),
                                                         
                                                          ]),
                                                    ));
                                              })),
                                     
                                    ])))
              ],
            )));
  }
}