import 'package:blueuniform/Constants/routes.dart';
import 'package:blueuniform/Controllers/CartController.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:blueuniform/Views/Widgets/input_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../Functions/valid_input.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                AppListTitle(text: 'delivery'.tr),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: InputForm(
                    isTextarea: 6,
                    label: 'address_label'.tr,
                    valid: (val) {
                      return validInput(val!, 3, 20, "text", true, null);
                    },
                    mycontroller: cartController.address,
                  ),
                ),
                ButtonForm(
                  text: 'continue_and_payment'.tr,
                  color: AppColors.secondary,
                  onPressed: () => {Get.toNamed(AppRoute.orderInfo)},
                )
              ],
            )));
  }
}
