import 'package:blueuniform/Constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/app_text_style.dart';
import '../../Controllers/FavoritesController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  FavoritesController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 2,
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                AppListTitle(text: 'favorite'.tr),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      GetBuilder<FavoritesController>(
                          init: favoriteController,
                          builder: (controller) => Flexible(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.favoriteItems.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                        child: Container(
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
                                              onTap: () => {
                                                Get.toNamed(AppRoute.product,
                                                    arguments: [
                                                      controller.categoryFromId(
                                                          controller
                                                              .favoriteItems[
                                                                  index]
                                                              .categoryId)
                                                    ])
                                              },
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        child: ClipRRect(
                                                      borderRadius: radius20,
                                                      child: Image.network(
                                                        controller
                                                            .favoriteItems[
                                                                index]
                                                            .image,
                                                        height: 80,
                                                        width: 80,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    )),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                            width: 110,
                                                            child: Text(
                                                              controller
                                                                  .favoriteItems[
                                                                      index]
                                                                  .name,
                                                              style: AppTextStyle
                                                                  .body
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                              overflow:
                                                                  TextOverflow
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
                                                              "${'price'.tr} : ${controller.favoriteItems[index].price}",
                                                              style:
                                                                  AppTextStyle
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
                                                            controller
                                                                .removeItem(
                                                                    index)
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: AppColors
                                                                  .grey,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 8),
                                                      ],
                                                    )
                                                  ]),
                                            )));
                                  }))),
                    ]))
              ],
            )));
  }
}
