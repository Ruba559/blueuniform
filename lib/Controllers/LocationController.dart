import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  final position = Rx<Position?>(null);

  @override
  Future<void> onInit() async {
    super.onInit();
   await getLocation();
    update();
  }

  Future<void> getLocation() async {
    var permission = await Permission.location.request();
    if (permission.isGranted) {
      Position? currentPosition = await Geolocator.getCurrentPosition();
      position.value = currentPosition;
         update();
    } else {
      print('Location permission denied');
    }
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
