import 'package:blueuniform/Constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../Constants/app_style.dart';
import '../../Constants/app_text_style.dart';

class InputForm extends StatelessWidget {
  final String? hinttext;
  final String? labeltext;
  // final IconData iconData;
  final bool passwordText;
  final String? Function(String?) valid;
  final TextEditingController? mycontroller;
  final String? label;
  final Color? color;
  final TextInputType keyboardType;
   final int? isTextarea;

  const InputForm(
      {super.key,
      this.hinttext,
      this.labeltext,
      this.mycontroller,
      required this.valid,
      TextStyle? labelStyle,
      this.passwordText = false,
      this.label,
      this.color = AppColors.black, 
     this.keyboardType = TextInputType.name, this.isTextarea = 1,});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.all(8),
          alignment: Alignment.bottomRight,
          child: Text(
            label!,
            style: AppTextStyle.body.copyWith(color: color),
          )),
      Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: TextFormField(
           maxLines: isTextarea  ,
          validator: valid,
          obscureText: passwordText,
          controller: mycontroller,
          textAlign: TextAlign.start,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: hinttext,
              filled: true,
              
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              focusedBorder: const OutlineInputBorder(
                borderRadius: radius10,
                borderSide: BorderSide(
                  color: AppColors.secondary,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: radius10,
                borderSide: BorderSide(
                  color: AppColors.secondary,
                ),
              ),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: radius10,
                borderSide: BorderSide(
                  color: AppColors.secondary,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: radius10,
                borderSide: BorderSide(
                  color: AppColors.secondary,
                ),
              )),
        ),
      )
    ]);
  }
}
