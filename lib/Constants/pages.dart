import 'package:blueuniform/Views/Screen/auth/about_screen.dart';
import 'package:blueuniform/Views/Screen/auth/contact_screen.dart';
import 'package:blueuniform/Views/Screen/auth/privacy_screen.dart';
import 'package:blueuniform/Views/Screen/auth/terms_screen.dart';
import 'package:get/get.dart';

import '../Views/Screen/address_screen.dart';
import '../Views/Screen/auth/login_info_screen.dart';
import '../Views/Screen/auth/login_screen.dart';
import '../Views/Screen/auth/register_screen.dart';
import '../Views/Screen/cart_screen.dart';
import '../Views/Screen/favorites_screen.dart';
import '../Views/Screen/home_screen.dart';
import '../Views/Screen/order_complate_screen.dart';
import '../Views/Screen/order_details_screen.dart';
import '../Views/Screen/order_info_screen.dart';
import '../Views/Screen/orders_screen.dart';
import '../Views/Screen/payment_methods_screen.dart';
import '../Views/Screen/position_screen.dart';
import '../Views/Screen/product_screen.dart';
import '../Views/Screen/profile_screen.dart';
import '../Views/Screen/setting_screen.dart';
import '../Views/Screen/splash_screen.dart';
import '../Views/Screen/splash_screen2.dart';
import 'routes.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(name: AppRoute.splashScreen, page: () => SplashScreen()),
  GetPage(
      name: AppRoute.splashScreen2,
      page: () => SplashScreen2(),
      transition: Transition.circularReveal),
  GetPage(
      name: AppRoute.login,
      page: () => LoginScreen(),
      transition: Transition.downToUp),
  GetPage(
      name: AppRoute.register,
      page: () => RegisterScreen(),
      transition: Transition.circularReveal),
  GetPage(
      name: AppRoute.loginInfo,
      page: () => LoginInfoScreen(),
      transition: Transition.circularReveal),
  GetPage(
    name: AppRoute.home,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: AppRoute.product,
    page: () => ProductScreen(),
  ),
  GetPage(
    name: AppRoute.cart,
    page: () => CartScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.position,
    page: () => PositionScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.orderInfo,
    page: () => OrderInfoScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.PaymentMethods,
    page: () => PaymentMethodsScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.orderComplate,
    page: () => OrderComplateScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.favorites,
    page: () => FavoritesScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.profile,
    page: () => ProfileScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.setting,
    page: () => SettingScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.getAddress,
    page: () => AddressScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.orders,
    page: () => OrdersScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.orderDetails,
    page: () => OrderDetailsScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.about,
    page: () => AboutScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.privacy,
    page: () => PrivacyScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.terms,
    page: () => TermsScreen(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: AppRoute.contactus,
    page: () => ContactScreen(),
    transition: Transition.leftToRight,
  ),
];
