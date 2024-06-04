import 'dart:io';

import 'package:blueuniform/Controllers/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../main.dart';

class ProfileController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController? password = TextEditingController();
  TextEditingController? name = TextEditingController();
  File? image;

  UserRepo userRepo = UserRepo();
  User? user;

  var isLoading = false.obs;
  
final UserController userController = Get.find();

  selectImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      image = File(file.path);
      update();
      print(image);
    }
  }

  void onInit() {
    setUserDetails(MyApp.user);
    super.onInit();
  }

  void setUserDetails(User? user) {
    if (user != null) {
      email.value = TextEditingValue(text: MyApp.user!.email);
      name!.value = TextEditingValue(text: MyApp.user!.studentName);
    }
  }

  updateProfile() async {
    if (email.text != '') {
      isLoading.value = true;
    
      user = await userRepo.updateProfile(
          MyApp.user?.id, email.text, name!.text, password!.text, image != null? image!.path : null);

      if (user != '') {
           isLoading.value = false;
        MyApp.user = user;
    await userController.saveAuthState(user!);
        update();
      }
    }
  }
}
