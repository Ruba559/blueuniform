import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/app_text_style.dart';
import '../../Controllers/HomeController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/list_title.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight ) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 0,
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              AppListTitle(text: 'الملابس المتاحة'),
              Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: (itemWidth / itemHeight),
                  children: List.generate(6, (index) {
                    return InkWell(
                        onTap: () => {
                          controller.getProduct()
                        },
                        onLongPress: () => {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                              fit: BoxFit.fill,
                              // controller.worksheets[index].image,
                              'https://blue.brain-solutions.agency/storage/product////sUbC70hnXR2WmewtjDp03b1mhX60yadpMhMheSA2.jpg'),
                        ));
                  }),
                ),
              ),
            ])));
  }
}
