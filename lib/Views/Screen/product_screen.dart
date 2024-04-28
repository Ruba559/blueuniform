import 'package:blueuniform/Constants/app_style.dart';
import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Controllers/HomeController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 0,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
              color: AppColors.secondary,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                 ),
              child: Image.network(
                  fit: BoxFit.fill,
                  height: 280,
                  width: double.infinity,
                  // controller.worksheets[index].image,
                  'https://blue.brain-solutions.agency/storage/product////sUbC70hnXR2WmewtjDp03b1mhX60yadpMhMheSA2.jpg'),
            ),
          )
        ]));
  }
}
