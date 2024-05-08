import 'dart:async';

import 'package:blueuniform/Controllers/HomeController.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Constants/routes.dart';
import '../../Controllers/LocationController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionScreen extends StatelessWidget {
  PositionScreen({super.key});
  // ProductController productController = Get.put(ProductController());
  HomeController homeController = Get.find();
  LocationController locationController = Get.put(LocationController());
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  //   CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(locationController.currentPosition.altitude, -122.085749655962),
  //   zoom: 14,
  // );
  List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    locationController.getPosision();
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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppListTitle(text: 'التوصيل'),
                GetBuilder<LocationController>(
                    builder: (controller) => Container(
                          height: 400,
                          width: double.infinity,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition:
                                locationController.kGooglePlex!,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                            markers: markers.toSet(),
                            onTap: (argument) {
                              print(argument.longitude);
                              markers.add(Marker(
                                  markerId: MarkerId("lili"),
                                  position: LatLng(
                                      argument.latitude, argument.longitude)));
                            },
                          ),
                        )),
                ButtonForm(
                  text: 'تعيين الموقع',
                  color: AppColors.secondary,
                  onPressed: () => {
                    Get.toNamed(AppRoute.orderInfo)
                    //   productController.getOrderInfo()
                  },
                )
              ],
            ))));
  }
}
