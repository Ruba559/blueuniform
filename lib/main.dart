import 'package:blueuniform/Constants/pages.dart';
import 'package:blueuniform/Data/lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'DataAccesslayer/Models/user.dart';
import 'bindings/init_bindings.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print(message.data);
//   print("Handling a background message: ${message.notification!.title}");
// }

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    // Force Hybrid Composition mode.
    mapsImplementation.useAndroidViewSurface = true;
  }
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static User? user;
  static int bottomSelectedItem = 0;
  @override
  Widget build(BuildContext context) {
    //Get.put(LocaleController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      getPages: getPages,
      translations: Lang(),
      initialBinding: InitBinding(),
    );
  }
}
