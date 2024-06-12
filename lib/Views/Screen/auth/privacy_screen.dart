import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';
import '../../Widgets/layouts/app-buttom-navbar.dart';
import '../../Widgets/layouts/appbar.dart';
import '../../Widgets/layouts/appdrawar.dart';
import '../../Widgets/list_title.dart';

class PrivacyScreen extends StatelessWidget {
  PrivacyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 0,
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppListTitle(text: 'terms'.tr),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      "شركة تعليمية تقـدم تعليماً متفـرداً يوائم متطلبات العصر، محافظة في بيئتها التعليمية على الهوية الإسلامية بأسلوب تربوي جاذب. منذ أن تأسست الشركة في عـام 2007م وبمنشآت مجهزة بأحدث الوسائل التعليمية والتقنية وبكادر إداري وتعليمـي خبير، حققت الشركة قفزات نوعية واستراتيجية بفضل الله ثم بفضل الرؤية السديدة والمواكبة لكل المستجدات. وها نحن اليوم نتواجـد في العديد مـن مناطق مملكتنا الحبيبة، داعمون لمسيرة التعليم، ومشاركون في التجديد والابتكار لنصبح أيقونة في مسيرة التنمية والعطاء والنماء.",
                      style: AppTextStyle.body.apply(color: AppColors.grey),
                    ),
                  ),
                )
              ],
            )));
  }
}
