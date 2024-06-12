import 'package:get/get.dart';
import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/favorite.dart';
import '../Views/Widgets/snackbar.dart';

class FavoritesController extends GetxController {
  List<Favorite> favoriteItems = [];
  BoxClient boxClient = BoxClient();

  @override
  void onInit() async {
    super.onInit();
    await getFavoriteItemsFromStorage();
  }

  Future<void> getFavoriteItemsFromStorage() async {
    favoriteItems = await boxClient.getFavoriteItems();

    update();
  }

  addToFavorites(category) async {
    var itemIndex = getItemIndex(category.id);

    if (itemIndex == null) {
      var item = Favorite(
        name: category.name,
        image: category.image,
        price: category.price,
        categoryId: category.id,
      );

      favoriteItems.add(item);
      await syncItems();

      SnackBars.showSuccess('added_to_favorites'.tr);
      update();
    } else {
      favoriteItems.removeAt(itemIndex);
      await syncItems();
      update();
      SnackBars.showSuccess('removed_from_favorites'.tr);
    }
  }

  Future<void> syncItems() async {
    await boxClient.addToFavorite(favoriteItems);
  }

  int? getItemIndex(category_id) {
    print(category_id);
    for (var index = 0; index < favoriteItems.length; index++) {
      if (favoriteItems[index].categoryId == category_id) {
        return index;
      }
    }
    return null;
  }

  Future<void> removeItem(index) async {
    favoriteItems.removeAt(index);

    await syncItems();

    update();
  }
}
