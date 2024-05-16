import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Controllers/AuthController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/list_title.dart';

class LoginInfoScreen extends StatelessWidget {
  const LoginInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(25),
          child: GetBuilder<AuthController>(
              builder: (controller) => Form(
                  key: controller.formstateinfo,
                  child: ListView(children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 150,
                    ),
                     AppListTitle(text: "login_information".tr, textAlign: 'center',),
                    InputForm(
                      label: 'رقم الجوال',
                      valid: (val) {
                        return validInput(val!, 2, 50, "phone", true, null);
                      },
                      mycontroller: controller.email,
                    ),
                    InputForm(
                      passwordText: true,
                      label: 'password'.tr,
                      valid: (val) {
                        return validInput(val!, 3, 20, "password", true, null);
                      },
                      mycontroller: controller.password,
                    ),
                    InputForm(
                      passwordText: true,
                      label: 'confirm_password'.tr,
                      valid: (val) {
                        return validInput(val!, 3, 20, "confirmPassword", true,
                            controller.password.text);
                      },
                      mycontroller: controller.confirmPassword,
                    ),
                    Obx(() {
                      return ButtonForm(
                        text: "create_account".tr,
                        color: AppColors.primary,
                        onPressed: () async {
                          controller.register();
                        },
                         isLoading: controller.isLoading.value
                      );
                    }),
                    ButtonForm(
                        text: "previous".tr,
                        color: AppColors.grey,
                        onPressed: () => {controller.getRegister()}),
                  ]))),
        )));
  }
}
