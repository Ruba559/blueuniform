import 'package:get/get.dart';
import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/cart.dart';
import '../Views/Widgets/snackbar.dart';

class CartController extends GetxController {
  List<Cart> cartItems = [];
  BoxClient boxClient = BoxClient();

  late num totalAmount = 0;

  var paymentMethode = 'sadad';

  void onInit() async {
    getCartItemsFromStorage();
    print(cartItems);
    update();
    super.onInit();
  }

  Future<void> getCartItemsFromStorage() async {
    cartItems = await boxClient.getCartItems();

    update();
  }

  addToCart(quantity, product, category) async {
    var cartItemIndex = getCartItemIndex(product.id, category.id);

    if (cartItemIndex == null) {
      var cartItem = Cart(
        quantity: quantity,
        product: product,
        category: category,
      );
      cartItems.add(cartItem);
      await syncCart();
      
      totalAmount += category.price * quantity;
      print(totalAmount);
      SnackBars.showSuccess('تمت الإضافة للسلة بنجاح');
      update();
    } else {
      SnackBars.showWarning('تمت الاضافة مسبقاً');
    }
  }

  Future<void> syncCart() async {
    await boxClient.addToCart(cartItems);
  
  }

  int? getCartItemIndex(product_id, category_id) {
    for (var index = 0; index < cartItems.length; index++) {
      if (cartItems[index].product!.id == product_id &&
          cartItems[index].category!.id == category_id) {
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
      } else {
        cartItems[index!].quantity = cartItems[index!].quantity - 1;
      }
    }

    await syncCart();

    update();
  }

  Future<void> calc() async {
    for (var item in cartItems) {
      totalAmount += item.category!.price;
    }
    update();
  }

  selectPaymentMethode(value) {
    paymentMethode = value;
    update();
  }
}