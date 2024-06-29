import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../Constants/routes.dart';

@pragma('vm:entry-point')
Future selectNotification(NotificationResponse? response) async {
  /*  bool checkOrderController = Get.isRegistered<OrderController>();
    if (!checkOrderController) {
      Get.put(OrderController());
    } */
/*     Get.put(OrderController()); */
  // ignore: avoid_print
  if (response != null) {
    Get.toNamed(response.payload!);
  }
  return null;
}

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();
// ignore: prefer_final_fields
  static AndroidNotificationDetails _androidNotificationDetails =
      const AndroidNotificationDetails(
    "12", "blueuniform",
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
    channelShowBadge: true,
    enableLights: true,
    enableVibration: true,

    //ongoing:
    //styleInformation: BigTextStyleInformation('')
  );

  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: _androidNotificationDetails);
  factory NotificationService() {
    return _notificationService;
  }
  Future<void> init() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, macOS: null);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: selectNotification,
        onDidReceiveBackgroundNotificationResponse: selectNotification);
  }

  Future<void> showNotifications(title, body, payload) async {
    print(title);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: AppRoute.notifications,
    );
  }

  NotificationService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
}
