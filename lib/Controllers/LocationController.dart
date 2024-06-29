import 'package:blueuniform/Controllers/CartController.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  Position? position = null;
  Marker mapMarker = Marker(markerId: MarkerId("currentLocation"));
  bool gettingLocation = false;
  bool showLocationRequest = false;
  CartController cartController = Get.find();
  @override
  Future<void> onInit() async {
    super.onInit();

    update();
  }

  void setMarker(LatLng latLng) async {
    mapMarker = Marker(
        markerId: MarkerId("currentLocation"),
        position: LatLng(latLng.latitude, latLng.longitude));
    cartController.updatePosition(latLng);
    update();
  }

  Future<void> getLocation() async {
    gettingLocation = true;
    update();
    var permission = await Permission.location.request();
    if (permission.isGranted) {
      Position? currentPosition = await Geolocator.getCurrentPosition();
      cartController.updatePosition(
          LatLng(currentPosition.latitude, currentPosition.longitude));
      position = currentPosition;
      mapMarker = Marker(
          markerId: MarkerId("currentLocation"),
          position:
              LatLng(currentPosition.latitude, currentPosition.longitude));
      gettingLocation = false;
      update();
    } else {
      showLocationRequest = true;
      update();
    }
    gettingLocation = false;
    update();
  }

  addInitialMarker() {
    final initialMarker = Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(position!.latitude, position!.longitude),
    );
    markers.add(initialMarker);
  }

  var markers = Set<Marker>().obs;

  void onMarkerTapped(LatLng position) {
    markers.clear();
    final newMarker = Marker(
      markerId: MarkerId('marker_1'),
      position: position,
      onTap: () => onMarkerTapped(position),
    );
    position = position;
    cartController.updatePosition(position);
    markers.add(newMarker);
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

  @override
  void onReady() async {
    await getLocation();
    super.onReady();
  }
}
