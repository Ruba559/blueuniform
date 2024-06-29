import 'package:blueuniform/Constants/pages.dart';
import 'package:blueuniform/Data/lang.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'DataAccesslayer/Clients/notification_service.dart';
import 'DataAccesslayer/Models/user.dart';
import 'bindings/init_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    // Force Hybrid Composition mode.
    mapsImplementation.useAndroidViewSurface = true;
  }
  await GetStorage.init();
  await NotificationService().init();
  await Firebase.initializeApp();
  print(await FirebaseMessaging.instance.getToken());
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('reviced message');
  var notificationService = NotificationService();
  await notificationService.showNotifications(
      message.data['title'], message.data['body'], message.data['payload']);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static User? user;
  static int bottomSelectedItem = 0;
  @override
  Widget build(BuildContext context) {
    //Get.put(LocaleController());
    return GetMaterialApp(
      title: 'Blue Uniform',
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      getPages: getPages,
      translations: Lang(),
      initialBinding: InitBinding(),
      theme: ThemeData(
        useMaterial3: false,
        // ...
      ),
    );
  }
}
