import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/UserRepo.dart';
import '../main.dart';

class ProfileController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController? password = TextEditingController();

  File? image;

  UserRepo userRepo = UserRepo();
  User? user;

  var isLoading = false.obs;

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
    }
  }

 updateProfile() async {
   
    if (email.text != '') {
      isLoading.value = true;
      user = await userRepo.updateProfile(
          MyApp.user?.id, email.text, password!.text, image!.path);

      if (user != '') {
        isLoading.value = false;
        MyApp.user = user;
        update();
      }
    }
  }
}
