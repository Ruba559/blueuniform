import 'package:blueuniform/Constants/app_text_style.dart';
import 'package:blueuniform/Views/Widgets/button_form.dart';
import 'package:blueuniform/Views/Widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/routes.dart';
import '../../Controllers/CartController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/list_title.dart';
import 'package:get/get.dart';

class PaymentMethodsScreen extends StatelessWidget {
  PaymentMethodsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 0,
        ),
           drawer: AppDrawer(),
        body:  Container(
           
            padding: const EdgeInsets.all(20),
            child:  SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppListTitle(text: 'وسائل الدفع المتاحة'),
               GetBuilder<CartController>(
                          builder: (controller) =>  Column(
                  children: [
                 Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.topRight,
                      child: Text(
                        'كيف تود دفع قيمة الطلب ؟ ',
                        style: AppTextStyle.body,
                      ),
                    ),
                   InkWell(
                    onTap: () => {
                      controller.selectPaymentMethode('sadad')
                    },
                    child:   PaymentMethodItem(
                      text: 'الدفع بواسطة سداد',
                      image: 'assets/images/sadad.png',
                      color : controller.paymentMethode == 'sadad' ? AppColors.secondary :AppColors.lightgrey,
                    ),)  ,
                    InkWell(
                    onTap: () => {
                      controller.selectPaymentMethode('visa')
                    },
                    child:   PaymentMethodItem(
                      text: 'الدفع بواسطة بطاقة دفع',
                      image: 'assets/images/visa.png',
                      color : controller.paymentMethode == 'visa' ? AppColors.secondary :AppColors.lightgrey,
                    ),),
                     InkWell(
                    onTap: () => {
                      controller.selectPaymentMethode('pay')
                    },
                    child: PaymentMethodItem(
                      text: 'الدفع بواسطة أبل باي',
                      image: 'assets/images/pay.png',
                      color : controller.paymentMethode == 'pay' ? AppColors.secondary :AppColors.lightgrey,
                    ),),
                     InkWell(
                    onTap: () => {
                      controller.selectPaymentMethode('paypal')
                    },
                    child:   PaymentMethodItem(
                      text: 'الدفع بواسطة بايبال',
                      image: 'assets/images/paypal.png',
                      color : controller.paymentMethode == 'paypal' ? AppColors.secondary :AppColors.lightgrey,
                    ),),
                  ],
                )),
                SizedBox(height: 15,),
                ButtonForm(
                  text: 'دفع قيمة الطلب',
                  color: AppColors.secondary,
                  onPressed: () => {Get.toNamed(AppRoute.orderComplate)},
                ),
              ],
            ),
          )),
        );
  }
}
