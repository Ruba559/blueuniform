
import 'package:blueuniform/Constants/pages.dart';
import 'package:blueuniform/Data/lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'DataAccesslayer/Models/user.dart';



// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print(message.data);
//   print("Handling a background message: ${message.notification!.title}");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
 
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
    );
  }
}
