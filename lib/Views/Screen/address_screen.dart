import 'package:blueuniform/Constants/app_style.dart';
import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:blueuniform/Views/Widgets/input_form.dart';
import 'package:flutter/material.dart';
import '../../Constants/app_color.dart';
import '../../Constants/routes.dart';
import '../../Controllers/CartController.dart';
import '../../Controllers/HomeController.dart';
import '../../Functions/valid_input.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

 
  HomeController homeController = Get.find();
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
                SizedBox(height: 100,),
                Flexible(
                    child: 
                 InputForm(
                  isTextarea : 4,
                      label: 'address_label'.tr,
                      valid: (val) {
                        return validInput(val!, 3, 20, "text", true, null);
                      },
                      mycontroller: homeController.address,
                    ),  
                    ),
                ButtonForm(
                  text: 'continue_and_payment'.tr,
                  color: AppColors.secondary,
                  onPressed: () => {
                            homeController.getOrderInfo()
                  },
                )
              ],
            )));
  }
}
