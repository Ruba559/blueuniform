import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Constants/routes.dart';
import '../../Controllers/ProductController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';
import 'package:get/get.dart';

class PositionScreen extends StatelessWidget {
  PositionScreen({super.key});
 ProductController productController = Get.find();
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
                AppListTitle(text: 'التوصيل'),
      // Expanded(child:  GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(37.7749, -122.4194), // San Francisco coordinates
      //     zoom: 12,
      //   ),
      // ),) ,
           ButtonForm(text: 'تعيين الموقع', color: AppColors.secondary , onPressed: () => {
            Get.toNamed(AppRoute.orderInfo)
                   //   productController.getOrderInfo()
                      },)
              ],
            )));
  }
}
