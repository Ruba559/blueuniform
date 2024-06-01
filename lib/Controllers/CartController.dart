import 'package:get/get.dart';
import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/cart.dart';
import '../Views/Widgets/snackbar.dart';

class CartController extends GetxController {
//  List<Cart> cartItems = [].obs;
  List<Cart> cartItems = <Cart>[].obs;

  BoxClient boxClient = BoxClient();

  late num totalAmount = 0;

  int quantity = 0;

  @override
  void onInit() async {
    super.onInit();
    await getCartItemsFromStorage();
    print('hi');
    print('$cartItems.length i');
    update();
  }

  Future<void> getCartItemsFromStorage() async {
    cartItems = await boxClient.getCartItems();
  update();
  }

  addToCart(quantity, name, image, price, id, categoryId) async {
    var cartItemIndex = getCartItemIndex(id, categoryId);
    if (cartItemIndex == null) {
      var cartItem = Cart(
        quantity: quantity,
        name: name,
        image: image,
        price: price,
        productId: id,
        categoryId: categoryId,
      );
      cartItems.add(cartItem);
      await syncCart();

      SnackBars.showSuccess('تمت الإضافة للسلة بنجاح');
      update();
    } else {
      SnackBars.showWarning('تمت الاضافة مسبقاً');
    }
  }

  Future<void> syncCart() async {
    await boxClient.addToCart(cartItems);
  update();
    print(cartItems.length);
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
        print(cartItems);
        cartItems.removeAt(index);
        print('ddddddddddddd');
        print(cartItems);
        await syncCart();
        await getCartItemsFromStorage();

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
      totalAmount += item.price;
    }
    update();
  }

  Future<void> clearCart() async {
    cartItems.clear();
    await syncCart();
    calc();
  }
  //  await showDialog(
  //     context: context,
  //     builder: (context) => new AlertDialog(...),
  //   );
}
