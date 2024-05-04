import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/app_text_style.dart';

class PaymentMethodItem extends StatelessWidget {
  final String text;
  final String? image;
  final Color? color;

  const PaymentMethodItem({super.key, required this.text, this.image, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: radius10,
          color: color ,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(6),
        child: InkWell(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              child: ClipRRect(
            borderRadius: radius20,
            child: Image.asset(
              image!,
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),
          )),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: color == AppColors.secondary ? AppTextStyle.body.copyWith(color: AppColors.white): AppTextStyle.body,
          ),
        ])));
  }
}
