import 'package:blueuniform/Views/Widgets/layouts/appdrawar.dart';
import 'package:flutter/material.dart';
import '../../Constants/app_color.dart';
import '../../Controllers/HomeController.dart';
import '../Widgets/layouts/app-buttom-navbar.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/list_title.dart';
import 'package:get/get.dart';

import '../Widgets/shimmer/category_shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(),
        bottomNavigationBar: AppButtomNavBar(
          selectedIndex: 0,
        ),
        drawer: AppDrawer(),
        body: Container(
            padding: const EdgeInsets.all(15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              AppListTitle(text: 'clothes_available'.tr),
              GetBuilder<HomeController>(
                  builder: (controller) => Flexible(
                        child: controller.isLoading.value
                            ? CategoryShimmer()
                            : GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: (itemWidth / itemHeight),
                                children: List.generate(
                                    controller.categories.length, (index) {
                                  return InkWell(
                                      onTap: () => {
                                             controller.getProduct(controller.categories[index])
                                            
                                          },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.network(
                                            fit: BoxFit.fill,
                                            controller.categories[index].image),
                                      ));
                                }),
                              ),
                      )),
            ])));
  }
}
