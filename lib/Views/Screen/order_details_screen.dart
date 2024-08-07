import 'package:blueuniform/Constants/app_style.dart';
import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:blueuniform/Controllers/OrderController.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../DataAccesslayer/Models/order.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({super.key});

  final OrderController controller = Get.find();
  final Order order = Get.arguments;
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
                AppListTitle(text: 'order'.tr + order.id.toString()),
                Flexible(
                    child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(241, 241, 241, 1),
                            borderRadius: radius10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'details'.tr,
                              style: AppTextStyle.medium,
                            ),
                            Divider(),
                            GetBuilder<OrderController>(
                                builder: (controller) => Expanded(
                                    flex: 3,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: order.orderDetails.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              padding: const EdgeInsets.all(5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      '• ${order.orderDetails[index].category!.name}',
                                                      style:
                                                          AppTextStyle.bodyBold,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '${'size'.tr} ${order.orderDetails[index].product!.size}  - ',
                                                        style:
                                                            AppTextStyle.small,
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text(
                                                          "${'number'.tr} ${order.orderDetails[index].quantity} - ",
                                                          style: AppTextStyle
                                                              .small),
                                                      Text(
                                                          "${'total'.tr} ${order.orderDetails[index].quantity * order.orderDetails[index].price}",
                                                          style: AppTextStyle
                                                              .small)
                                                    ],
                                                  ),
                                                ],
                                              ));
                                        }))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    //  alignment: Alignment.bottomRight,
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
                                            " ${order.totalPrice.toString()} ريال سعودي",
                                            style: AppTextStyle.title.copyWith(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )))
                          ],
                        ))),
                ButtonForm(
                  text: order.status == 0 ? 'update'.tr : 'order_done'.tr,
                  color:
                      order.status == 0 ? AppColors.secondary : AppColors.grey,
                  onPressed: () => {controller.updateOrder(order)},
                )
              ],
            )));
  }
}
