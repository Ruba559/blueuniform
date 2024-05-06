import 'package:get/get.dart';
import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/Favorite.dart';
import '../Views/Widgets/snackbar.dart';

class FavoritesController extends GetxController {
  List<Favorite> favoriteItems = [];
  BoxClient boxClient = BoxClient();

  Future<void> getFavoriteItemsFromStorage() async {
    favoriteItems = await boxClient.getFavoriteItems();

    update();
  }

  addToFavorites(product, category) async {
    var itemIndex = getItemIndex(product.id, category.id);

    if (itemIndex == null) {
      var item = Favorite(
        product: product,
        category: category,
        product_id : product.id,
      );
      print(item.category!.name);
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

  int? getItemIndex(product_id, category_id) {
    print(favoriteItems);
    for (var index = 0; index < favoriteItems.length; index++) {
      if (favoriteItems[index].product!.id == product_id &&
          favoriteItems[index].category!.id == category_id) {
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
