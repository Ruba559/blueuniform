import 'package:blueuniform/Controllers/HomeController.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Constants/app_color.dart';
import '../../Controllers/LocationController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';

class PositionScreen extends StatelessWidget {
  PositionScreen({super.key});

  final HomeController homeController = Get.find();

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
            child: SingleChildScrollView(
                child: GetBuilder<LocationController>(
                    builder: (controller) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppListTitle(text: 'delivery'.tr),
                            Container(
                              height: 400,
                              width: double.infinity,
                              child: Obx(
                                () => GoogleMap(
                                 onTap: (position)=> {
            controller.onMarkerTapped(position)
          },
                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      controller.position.value?.latitude ??
                                          0.0,
                                      controller.position.value?.longitude ??
                                          0.0,
                                    ),
                                    zoom: 14,
                                  ),
                                   markers: controller.markers.toSet(),
                                  // markers: Set<Marker>.from([
                                  //   Marker(
                                       
                                  //     markerId: MarkerId('currentPosition'),
                                  //     position: LatLng(
                                  //       controller.position.value?.latitude ??
                                  //           0.0,
                                  //       controller.position.value?.longitude ??
                                  //           0.0,
                                  //     ),
                                  //     infoWindow:
                                  //         InfoWindow(title: 'Current Position'),
                                  //   ),
                                  // ]),
                                ),
                              ),
                            ),
                            ButtonForm(
                              text: "set_location".tr,
                              color: AppColors.secondary,
                              onPressed: () => {
                                //Get.toNamed(AppRoute.)
                                homeController
                                    .getAddress(controller.position.value)
                              },
                            )
                          ],
                        )))));
  }
}
