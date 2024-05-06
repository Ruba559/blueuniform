import 'dart:async';

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
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionScreen extends StatelessWidget {
  PositionScreen({super.key});
  ProductController productController = Get.put(ProductController());
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );
  List<Marker> markers = [];
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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppListTitle(text: 'التوصيل'),
                Container(
                  height: 400,
                  width: double.infinity,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: markers.toSet(),
                    onTap: (argument) {
                      print(argument.longitude);
                      markers.add(Marker(
                          markerId: MarkerId("lili"),
                          position:
                              LatLng(argument.latitude, argument.longitude)));
                     

                    },
                  ),
                ),
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
