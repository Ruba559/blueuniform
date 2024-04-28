import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class LabelForm extends StatelessWidget {
    final String? text;
      final Color?  color ;
  
  const LabelForm({super.key,  this.text, this.color = AppColors.black });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      child: Text(text! , style: AppTextStyle.body.copyWith(color: color), )
    );
  }
}