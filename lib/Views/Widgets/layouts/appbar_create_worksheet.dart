import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';

class AppAppBarCreateWorksheet extends StatelessWidget
    implements PreferredSizeWidget {
  AppAppBarCreateWorksheet({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 1,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
      ),
      title: Container(child: Text("create_worksheet".tr , style: AppTextStyle.medium.copyWith(fontWeight: FontWeight.bold),)),
      actions: [
        InkWell(
          onTap: onPressed,
          child: Icon(
            Icons.chevron_right,
            size: 35,
          ),
        )
      ],
    );
  }
}
