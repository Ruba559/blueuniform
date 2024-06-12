import 'package:blueuniform/Controllers/HomeController.dart';
import 'package:blueuniform/DataAccesslayer/Models/category.dart';
import 'package:get/get.dart';

class ProductScreenController extends GetxController {
   Category? category;
  final int categoryId;
  final int selectedProduct = 0;
  ProductScreenController({required this.categoryId});
  final HomeController homeController = Get.find();
  @override
  void onInit() {
    super.onInit();
  }
}
