import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/LoginController.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/list_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.white,
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
                    AppListTitle(text: "login".tr, textAlign: 'center',),
                    InputForm(
                      label: 'phone'.tr,
                      valid: (val) {
                        return validInput(val!, 2, 50, "phone", true, null);
                      },
                      keyboardType: TextInputType.phone,
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
                    Text(
                      controller.message != '' ? controller.message : '',
                      style: AppTextStyle.small.copyWith(color: Colors.red),
                    ),
                    Obx(() {
                      return ButtonForm(
                          text: "continue".tr,
                          color: AppColors.secondary,
                          onPressed: () async {
                            controller.login();
                          },
                          isLoading: controller.logging.value);
                    }),
                     Text(
                      "dont_have_an_account".tr,
                      style: AppTextStyle.body,
                      textAlign: TextAlign.center,
                    ),
                   ButtonForm(
                          text: "create_your_own_account".tr,
                          
                          color: AppColors.primary,
                          onPressed: () => {controller.getRegister()})
                  
                  ]))),
        )));
  }
}
