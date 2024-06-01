import 'package:get/get.dart';

import '../Controllers/ProfileController.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }
}