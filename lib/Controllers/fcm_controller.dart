// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../DataAccesslayer/Clients/notification_service.dart';

class FCMController extends GetxController {
  late final FirebaseMessaging messaging;
  late NotificationService notificationService;

/*   UserController userController = Get.find<UserController>(); */

/*   late NotificationsContoller notificationContoller =
      Get.put(NotificationsContoller()); */

  String? fcmtoken;
  @override
  void onInit() async {
    super.onInit();
    registerNotification();
    notificationService = NotificationService();
  }

  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();

    // 2. Instantiate Firebase Messaging
    messaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }
    fcmtoken = await FirebaseMessaging.instance.getToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("recived");
      /*  notiController.getNoties();
      if (message.data['type'] == 'message') {
        await messagesController.getMessages();
        messagesController
            .setCurrentTeacher(int.parse(message.data['teacher_id']));
      } */

      await notificationService.showNotifications(
          message.data['title'], message.data['body'], message.data['payload']);
    });

    Future firebaseMessagingBackgroundHandler(RemoteMessage message) async {
      print("incomming message");
      print(message);
      await Firebase.initializeApp();
      var notificationService = NotificationService();
      await notificationService.showNotifications(message.data['title'],
          message.data['body'], message.data['click_action']);
    }

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}
