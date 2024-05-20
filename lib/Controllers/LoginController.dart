import 'package:blueuniform/Controllers/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../main.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  BoxStorage boxStorage = BoxStorage();

  UserRepo userRepo = UserRepo();
  late User user;

  var logging = false.obs;

  var message = '';
  final UserController userController = Get.find();

  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  login() async {
    if (formstate.currentState!.validate()) {
      logging.value = true;
      if (await userRepo.login(email.text, password.text) != '') {
        late User user;
        user = await userRepo.login(email.text, password.text);
        MyApp.user = user;
        await userController.saveAuthState(user);

        logging.value = false;
        message = '';
        update();
        print('object');
        Get.offAllNamed(AppRoute.home);
      } else {
        print('غير');
        message = 'البيانات غير متطابقة';
        logging.value = false;
        update();
      }
    }
  }

  getRegister() {
    Get.toNamed(AppRoute.register);
  }

  getUser() async {
    user = await boxStorage.getUser();
  }

  logout() async {
    await boxStorage.removeUser();
    MyApp.user = null;
    Get.offAllNamed(AppRoute.login);
  }
}
