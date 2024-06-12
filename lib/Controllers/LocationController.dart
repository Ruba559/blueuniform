import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  final position = Rx<Position?>(null);

  @override
  Future<void> onInit() async {
    super.onInit();
    await getLocation();
    await addInitialMarker();
    update();
  }

  Future<void> getLocation() async {
    var permission = await Permission.location.request();
    if (permission.isGranted) {
      Position? currentPosition = await Geolocator.getCurrentPosition();
      position.value = currentPosition;
      print(position.value);
      update();
    } else {
      print('Location permission denied');
    }
  }

   addInitialMarker() {
    final initialMarker = Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(position.value!.latitude, position.value!.longitude),
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
}
