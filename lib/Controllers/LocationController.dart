import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Views/Widgets/snackbar.dart';

class LocationController extends GetxController {
  late Position currentPosition;

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  // static  CameraPosition kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14,
  // );
  getPosision() async {
    LocationPermission per;
    print('object1');
    per = await Geolocator.checkPermission();
    print('object2');
    if (per == LocationPermission.always) {
      currentPosition = await getLatAndLong();
      kGooglePlex = CameraPosition(
        target: LatLng(currentPosition.longitude, currentPosition.altitude),
        zoom: 14,
      );
      print('object');
      print(kGooglePlex);
    }
  }

  Future<Position> getLatAndLong() async {
    print('اهاهاه');
    return Geolocator.getCurrentPosition().then((value) => value);
  }

  Future<bool> checkLocationServiceEnabled() async {
    bool services;

    services = await Geolocator.isLocationServiceEnabled();

    if (services == false) {
      return false;
    } else {
      return true;
    }
  }
}
