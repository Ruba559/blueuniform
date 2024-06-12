import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class AppListTitle extends StatelessWidget {
  final String text;
  final Color? color;
  final String? textAlign;

  const AppListTitle(
      {super.key,
      required this.text,
      this.color = AppColors.primary,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: AppTextStyle.title.copyWith(fontWeight: FontWeight.bold),
          //   textAlign: textAlign == 'center' ? TextAlign.center : TextAlign.right,
        ),
      ),
    );
  }
}
