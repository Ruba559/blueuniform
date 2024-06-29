import 'package:blueuniform/Constants/app_style.dart';
import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:blueuniform/Controllers/ProductScreenController.dart';
import 'package:blueuniform/DataAccesslayer/Models/category.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../DataAccesslayer/Models/product.dart';
import '../Widgets/label_form.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final Category category = Get.arguments[0];
  ProductScreenController controller = Get.put(
    ProductScreenController(category: Get.arguments[0]),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 0,
        ),
        //   drawer: AppDrawer(),
        body: CustomScrollView(slivers: [
          SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.white,
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    padding: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(80)),
                      color: AppColors.secondary,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                      ),
                      child: Hero(
                        tag: category.id,
                        child: Image.network(
                          fit: BoxFit.cover,
                          category.image,
                        ),
                      ),
                    )),
              )),
          SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.all(25),
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            Text(
                              category.name,
                              style: AppTextStyle.title,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            /* Text(
                              MyApp.user!.stage,
                              style: AppTextStyle.body
                                  .copyWith(color: AppColors.secondary),
                            ) */
                          ]),
                          Column(children: [
                            Text(
                              category.price.toString(),
                              style: AppTextStyle.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondary),
                            ),
                            Text(
                              'ريال سعودي',
                              style: AppTextStyle.small,
                            )
                          ])
                        ]),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: LabelForm(
                        text: "available_sizes".tr,
                      ),
                    ),
                    GetBuilder(
                        init: controller,
                        builder: (_) => InputDecorator(
                              decoration: const InputDecoration(
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: radius10,
                                  borderSide: BorderSide(
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<Product>(
                                  isDense: true,
                                  isExpanded: true,
                                  value: controller.selectedProduct,
                                  items: controller.productList,
                                  onChanged: (Product? value) {
                                    controller.selectSize(value);
                                  },
                                ),
                              ),
                            )),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: LabelForm(
                        text: "required_quantity".tr,
                      ),
                    ),
                    GetBuilder(
                        init: controller,
                        builder: (_) => Row(
                                children: List.generate(
                              5,
                              (i) {
                                return InkWell(
                                    onTap: () =>
                                        {controller.selectQuantity(i + 1)},
                                    child: Container(
                                      margin: EdgeInsets.all(7),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: controller.quantity == (i + 1)
                                              ? AppColors.secondary
                                              : AppColors.grey,
                                          border: Border.all(
                                              width: 2,
                                              color: AppColors.secondary),
                                          borderRadius: radius10),
                                      child: Text(
                                        (i + 1).toString(),
                                        style: AppTextStyle.body.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                controller.quantity == (i + 1)
                                                    ? null
                                                    : AppColors.white),
                                      ),
                                    ));
                              },
                            ))),
                    Row(
                      children: [
                        ButtonForm(
                          text: "add_to_cart".tr,
                          color: AppColors.secondary,
                          width: 225,
                          onPressed: () => {controller.addToCart()},
                        ),
                        GetBuilder(
                            init: controller,
                            builder: (_) => InkWell(
                                  onTap: () => {controller.addToFavorite()},
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius: radius10),
                                      child: controller.inFavorite
                                          ? Icon(
                                              Icons.favorite_sharp,
                                              color: AppColors.white,
                                            )
                                          : Icon(
                                              Icons.favorite_border,
                                              color: AppColors.white,
                                            )),
                                ))
                      ],
                    )
                  ],
                )),
          ),
        ]));
  }
}
