import 'package:get/get.dart';

import '../Middlewares/AuthMiddleware.dart';
import '../Views/Screen/auth/login_info_screen.dart';
import '../Views/Screen/auth/login_screen.dart';
import '../Views/Screen/auth/register_screen.dart';
import '../Views/Screen/home_screen.dart';
import '../Views/Screen/product_screen.dart';
import '../Views/Screen/splash_screen.dart';
import 'routes.dart';

List<GetPage<dynamic>> getPages = [
   GetPage(name: AppRoute.splashScreen, page: () => SplashScreen()),

  GetPage(
      name: AppRoute.login,
      page: () => LoginScreen(),
      transition: Transition.circularReveal),
GetPage(
      name: AppRoute.register,
      page: () => RegisterScreen(),
      transition: Transition.circularReveal
    ),
      GetPage(
      name: AppRoute.loginInfo,
      page: () => LoginInfoScreen(),
     transition: Transition.circularReveal
    ),
  GetPage(
      name: AppRoute.home,
      page: () => HomeScreen(),
       //middlewares: [AuthMiddleWare()],
     ),

      GetPage(
      name: AppRoute.product,
      page: () => ProductScreen(),
        transition: Transition.circularReveal,
     ),
    //    GetPage(
    //   name: AppRoute.cart,
    //   page: () => CartScreen(),
    //     transition: Transition.circularReveal,
    //  ),


];
