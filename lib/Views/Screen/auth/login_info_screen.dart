import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/AuthController.dart';
import '../../../Controllers/LoginController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/label_form.dart';
import '../../Widgets/list_title.dart';

class LoginInfoScreen extends StatelessWidget {
  const LoginInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      //   fit: BoxFit.fill,
                    ),
                    const AppListTitle(text: 'معلومات الدخول', textAlign: 'center',),
                    InputForm(
                      label: 'رقم الجوال',
                      valid: (val) {
                        return validInput(val!, 2, 50, "phone", true, null);
                      },
                      mycontroller: controller.email,
                    ),
                    InputForm(
                      passwordText: true,
                      label: 'كلمة المرور ',
                      valid: (val) {
                        return validInput(val!, 3, 20, "password", true, null);
                      },
                      mycontroller: controller.password,
                    ),
                    InputForm(
                      passwordText: true,
                      label: 'تأكيد كلمة المرور',
                      valid: (val) {
                        return validInput(val!, 3, 20, "confirmPassword", true,
                            controller.password.text);
                      },
                      mycontroller: controller.confirmPassword,
                    ),
                    Obx(() {
                      return ButtonForm(
                        text: "إنشاء الحساب",
                        color: AppColors.primary,
                        onPressed: () async {
                          controller.register();
                        },
                         isLoading: controller.isLoading.value
                      );
                    }),
                    ButtonForm(
                        text: "السابق",
                        color: AppColors.grey,
                        onPressed: () => {controller.getRegister()}),
                  ]))),
        )));
  }
}
