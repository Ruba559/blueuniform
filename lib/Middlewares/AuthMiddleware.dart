import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  
  BoxStorage boxStorage = BoxStorage();

  @override
  RouteSettings? redirect(String? route) {
   
    if ( boxStorage.checkAuth()) {
      return const RouteSettings(name: AppRoute.home);
    }
    return null;
  }
}

