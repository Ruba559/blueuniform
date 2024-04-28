import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/LoginController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/label_form.dart';
import '../../Widgets/list_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(25),
          child: GetBuilder<LoginController>(
              builder: (controller) => Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 150,
                      //   fit: BoxFit.fill,
                    ),
                   const AppListTitle(text: 'تسجيل الدخول', textAlign: 'center',),
                    InputForm(
                      label: 'رقم الجوال',
                      valid: (val) {
                        return validInput(val!, 2, 50, "phone", true, null);
                      },
                      keyboardType: TextInputType.phone,
                      mycontroller: controller.email,
                    ),
                    InputForm(
                      passwordText: true,
                      label: 'كلمة المرور',
                      valid: (val) {
                        return validInput(val!, 3, 20, "password", true, null);
                      },
                      mycontroller: controller.password,
                    ),
                    Text(
                      controller.message != '' ? controller.message : '',
                      style: AppTextStyle.small.copyWith(color: Colors.red),
                    ),
                    Obx(() {
                      return ButtonForm(
                          text: "متابعة",
                          color: AppColors.secondary,
                          onPressed: () async {
                            controller.login();
                          },
                          isLoading: controller.logging.value);
                    }),
                    const Text(
                      'ليس لديك حساب ؟ ',
                      style: AppTextStyle.body,
                      textAlign: TextAlign.center,
                    ),
                   ButtonForm(
                          text: "أنشئ حسابك الخاص",
                          
                          color: AppColors.primary,
                          onPressed: () => {controller.getRegister()})
                  
                  ]))),
        )));
  }
}
