import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';
import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/app_text_style.dart';
import '../../Controllers/CartController.dart';
import '../../Controllers/HomeController.dart';
import '../../Controllers/LocationController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  CartController cartController = Get.find();
    HomeController hometController = Get.find();
     LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    cartController.getCartItemsFromStorage();
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
                AppListTitle(text: 'shopping_cart'.tr),
                Expanded(
                    child:  GetBuilder<CartController>(
                          builder: (controller) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Flexible(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.cartItems.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            borderRadius: radius10,
                                            color: AppColors.white,
                                            border: Border.all(
                                                width: 0.8,
                                                color: AppColors.grey)),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        padding: const EdgeInsets.all(6),
                                        child: InkWell(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    child: ClipRRect(
                                                  borderRadius: radius20,
                                                  child: Image.network(
                                                    controller.cartItems[index]
                                                        .category!.image,
                                                    height: 80,
                                                    width: 80,
                                                    fit: BoxFit.fill,
                                                  ),
                                                )),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: 110,
                                                        child: Text(
                                                          controller
                                                              .cartItems[index]
                                                              .category!
                                                              .name,
                                                          style: AppTextStyle
                                                              .body
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                           '${'quantity'.tr} : ${controller.cartItems[index].quantity}'
                                                          ,
                                                          style: AppTextStyle
                                                              .xsmall,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          '${'price'.tr} : ${controller.cartItems[index].category!.price}'
                                                          ,
                                                          style: AppTextStyle
                                                              .xsmall,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () => {
                                                        controller.cartItems[index].quantity <=
                                                                1
                                                            ? Get.defaultDialog(
                                                                middleText: '',
                                                                title:
                                                                    "delete_title".tr,
                                                                buttonColor:
                                                                    AppColors
                                                                        .red,
                                                                confirmTextColor:
                                                                    AppColors
                                                                        .white,
                                                                cancelTextColor:
                                                                    AppColors
                                                                        .black,
                                                                textConfirm:
                                                                    'delete'.tr,
                                                                textCancel:
                                                                    'close'.tr,
                                                                onConfirm: () =>
                                                                    {
                                                                      controller.updateQuantity(
                                                                          index,
                                                                          'minus'),
                                                                          Navigator.pop(context, true)
                                                                    })
                                                            : controller
                                                                .updateQuantity(
                                                                    index,
                                                                    'minus')
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: AppColors
                                                                    .secondary,
                                                                borderRadius:
                                                                    radius30),
                                                        child: Icon(
                                                          Icons.remove_outlined,
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    InkWell(
                                                        onTap: () => {
                                                              controller
                                                                  .updateQuantity(
                                                                      index,
                                                                      'plus')
                                                            },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: AppColors
                                                                      .secondary,
                                                                  borderRadius:
                                                                      radius30),
                                                          child: Icon(
                                                              Icons
                                                                  .add_outlined,
                                                              color: AppColors
                                                                  .white),
                                                        )),
                                                    SizedBox(width: 8),
                                                  ],
                                                )
                                              ]),
                                        ));
                                  })),
                      ButtonForm(
                        text: 'continue'.tr,
                        color: cartController.cartItems.length  <= 0 ? AppColors.grey : AppColors.secondary,
                        onPressed: () => { cartController.cartItems.length  <= 0 ? null : hometController.getPosition() },
                      )
                    ]))
            )],
            )));
  }
}
