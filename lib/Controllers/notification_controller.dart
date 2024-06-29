import 'package:blueuniform/DataAccesslayer/Models/notifications.dart';
import 'package:blueuniform/DataAccesslayer/Repository/UserRepo.dart';
import 'package:blueuniform/main.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  UserRepo userRepo = UserRepo();
  List<BackNotification> notifications = [];

  bool loadingNoties = false;

  Future<void> getNoties() async {
    loadingNoties = true;
    update();

    notifications = await userRepo.getNoties(MyApp.user!.id);
    loadingNoties = false;
    update();
  }
}
