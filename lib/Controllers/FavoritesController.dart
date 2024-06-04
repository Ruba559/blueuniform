import 'package:blueuniform/DataAccesslayer/Models/product.dart';
import 'package:get/get.dart';
import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/favorite.dart';
import '../Views/Widgets/snackbar.dart';

class FavoritesController extends GetxController {
  List<Favorite> favoriteItems = [];
  BoxClient boxClient = BoxClient();

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

      SnackBars.showSuccess('تمت الإضافة للمفضلة بنجاح');
      update();
    } else {
      SnackBars.showWarning('تمت الاضافة مسبقاً');
    }
  }

  Future<void> syncItems() async {
    await boxClient.addToFavorite(favoriteItems);
  }

  int? getItemIndex( category_id) {
    print(favoriteItems);
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
