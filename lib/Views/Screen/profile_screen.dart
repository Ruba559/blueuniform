import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Functions/valid_input.dart';
import '../../../main.dart';
import '../../Controllers/ProfileController.dart';
import '../Widgets/button_form.dart';
import '../Widgets/input_form.dart';
import '../Widgets/label_form.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection:
            Get.locale == Locale('ar') ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppAppBar(),
            drawer: AppDrawer(),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppListTitle(text: 'profile'.tr),
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                        child: GetBuilder(
                            init: controller,
                            builder: (_) {
                              return ListView(children: [
                                SizedBox(
                                  height: 130,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.center,
                                    fit: StackFit.loose,
                                    children: [
                                      CircleAvatar(
                                        minRadius: 50,
                                        backgroundColor: AppColors.white,
                                        child: ClipOval(
                                          child: controller.image != null
                                              ? Image.file(
                                                  controller.image!,
                                                  fit: BoxFit.contain,
                                                )
                                              : MyApp.user != null
                                                  ? Image.network(
                                                      MyApp.user!.image,
                                                      fit: BoxFit.contain,
                                                    )
                                                  : Image.asset(
                                                      'assets/images/logo.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 3,
                                          left: 0,
                                          right: -65,
                                          child: InkWell(
                                            onTap: () async {
                                              await controller.selectImage();
                                            },
                                            child: Container(
                                              child: Icon(
                                                FontAwesomeIcons
                                                    .solidPenToSquare,
                                                color: AppColors.primary,
                                                size: 18,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                InputForm(
                                  label: "phone".tr,
                                  valid: (val) {
                                    return validInput(
                                        val!, 2, 50, "phone", true, null);
                                  },
                                  mycontroller: controller.email,
                                ),
                                InputForm(
                                  passwordText: true,
                                  label: 'password'.tr,
                                  valid: (val) {
                                    return validInput(
                                        val!, 3, 20, "password", true, null);
                                  },
                                  mycontroller: controller.password,
                                ),
                                SizedBox(height: 20),
                                Obx(() {
                                  return ButtonForm(
                                      text: 'save'.tr,
                                      color: AppColors.secondary,
                                      onPressed: () async {
                                        controller.updateProfile();
                                      },
                                      isLoading: controller.isLoading.value);
                                }),
                              ]);
                            })),
                  ],
                ))),
      ),
    );
  }
}
