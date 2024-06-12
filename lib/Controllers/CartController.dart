import 'package:get/get.dart';

import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/cart.dart';
import '../Views/Widgets/snackbar.dart';

class CartController extends GetxController {
  List<Cart> cartItems = [];

  BoxClient boxClient = BoxClient();

  late num totalAmount = 0;

  int quantity = 0;

  @override
  void onInit() async {
    super.onInit();
    await getCartItemsFromStorage();
  }

  Future<void> getCartItemsFromStorage() async {
    cartItems = await boxClient.getCartItems();
  }

  addToCart(quantity, category, product) async {
    var cartItemIndex = getCartItemIndex(product.id, category.id);
    if (cartItemIndex == null) {
      var cartItem = Cart(
        quantity: quantity,
        name: category.name,
        image: category.image,
        price: category.price,
        productId: product.id,
        categoryId: category.id,
        orderId: 0,
      );
      cartItems.add(cartItem);
      await syncCart();

      SnackBars.showSuccess('added_to_cart'.tr);
      update();
    } else {
      SnackBars.showWarning('already_added'.tr);
    }
  }

  Future<void> syncCart() async {
    await boxClient.addToCart(cartItems);
  }

  Future<void> syncCartUpdate(value) async {
    await boxClient.addToCart(value);
  }

  int? getCartItemIndex(product_id, category_id) {
    for (var index = 0; index < cartItems.length; index++) {
      if (cartItems[index].productId == product_id &&
          cartItems[index].categoryId == category_id) {
        return index;
      }
    }
    return null;
  }

  Future<void> updateQuantity(index, type) async {
    if (type == 'plus') {
      cartItems[index!].quantity = cartItems[index!].quantity + 1;
    }
    if (type == 'minus') {
      if (cartItems[index!].quantity <= 1) {
        cartItems.removeAt(index);
        await syncCart();

        print(cartItems.length);
      } else {
        cartItems[index!].quantity = cartItems[index!].quantity - 1;
      }
    }

    update();
    print(cartItems.length);
  }

  Future<void> calc() async {
    for (var item in cartItems) {
      totalAmount += item.price * item.quantity;
    }
    update();
  }

  Future<void> clearCart() async {
    cartItems.clear();
    await syncCart();
    calc();
  }
}
