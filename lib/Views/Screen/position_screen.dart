import 'package:blueuniform/Controllers/CartController.dart';
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
  final LocationController controller =
      Get.put<LocationController>(LocationController());
  CartController cartController = Get.find();
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
            child: GetBuilder(
                init: controller,
                builder: (_) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppListTitle(text: 'delivery'.tr),
                        Flexible(
                          fit: FlexFit.loose,
                          child: !controller.gettingLocation
                              ? controller.position != null
                                  ? GoogleMap(
                                      onTap: (value) {
                                        controller.setMarker(value);
                                      },
                                      mapType: MapType.normal,
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(
                                          controller.position?.latitude ?? 0.0,
                                          controller.position?.longitude ?? 0.0,
                                        ),
                                        zoom: 14,
                                      ),
                                      markers: Set<Marker>.from(
                                          [controller.mapMarker]),
                                    )
                                  : SizedBox()
                              : CircularProgressIndicator(),
                        ),
                        ButtonForm(
                          text: "set_location".tr,
                          color: AppColors.secondary,
                          onPressed: () =>
                              {cartController.getAddress()},
                        )
                      ],
                    ))));
  }
}
