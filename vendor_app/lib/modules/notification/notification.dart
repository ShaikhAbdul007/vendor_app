import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vendor_app/helper/constant.dart';
import '../../cache manager/cache_manager.dart';

class NotificationServices with CacheManager {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  void notificationPermission() async {
    NotificationSettings setting = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);

    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      Constant.printLog('Notifcation permission granted');
    } else if (setting.authorizationStatus == AuthorizationStatus.provisional) {
      Constant.printLog('Notifcation permission granted');
    } else {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
      Constant.printLog('Notifcation permission not granted');
    }
  }

  Future<String> getDeviceToken() async {
    String? getDeviceToken = await messaging.getToken();
    Constant.printLog('getDeviceToken is $getDeviceToken');
    return getDeviceToken ?? 'No Device Token Found';
  }

  Future<void> initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_launcher');
    var iosInitializationSettings = DarwinInitializationSettings();

    var initialization = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    try {
      await flutterLocalNotificationsPlugin.initialize(
        initialization,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          Constant.printLog(
              "onDidReceiveNotificationResponse: ${response.payload}");
          Constant.printLog("onDidReceiveNotificationResponse: ${response.id}");
          String id = response.id.toString(); // Convert id to String

          //  handlePayload(response.payload, id);
        },
        onDidReceiveBackgroundNotificationResponse:
            (NotificationResponse response) {
          Constant.printLog(
              "onDidReceiveBackgroundNotificationResponse: ${response.payload}");
          Constant.printLog(
              "onDidReceiveBackgroundNotificationResponse: ${response.id}");
          String id = response.id.toString(); // Convert id to String

          //  handlePayload(response.payload, id);
        },
      );
    } catch (e) {
      Constant.printLog('Error during initialization: $e');
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      playSound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>();

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@drawable/ic_launcher',
    );
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    int notificationId = 0;

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
          notificationId,
          message.notification?.title.toString(),
          message.notification?.body.toString(),
          notificationDetails,
          payload: message.data['topic']);
    });
  }

  Future forgroundIosMessege() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  Future<void> init(BuildContext context) async {
    FirebaseMessaging.onMessage.listen((message) async {
      if (kDebugMode) {
        Constant.printLog(
            "Handling a onMessage body message: ${message.notification?.body}");
        Constant.printLog(
            "Handling a onMessage title message: ${message.notification?.title}");
        Constant.printLog(
            "Handling a onMessage topic message: ${message.data['topic']}");
        Constant.printLog(
            "Handling a onMessage id message: ${message.data['id']}");
      }
      await initLocalNotification(context, message);
      await showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      if (kDebugMode) {
        Constant.printLog(
            "Handling a onMessageOpenedApp body message: ${message.notification?.body}");
        Constant.printLog(
            "Handling a onMessageOpenedApp title message: ${message.notification?.title}");
        Constant.printLog(
            "Handling a onMessageOpenedApp topic message: ${message.data['topic']}");
        Constant.printLog(
            "Handling a onMessageOpenedApp id message: ${message.data['id']}");
      }
    });
  }

  // Future<void> handlePayload(String? payload, String id) async {

  //   Constant.printLog('Payload: $payload, ID: $id');
  //   if (payload == null || payload.isEmpty) {
  //     Constant.printLog('Payload is null');
  //     MyRoutes.navigateToRoute(routeName: MyRoutes.loginScreen);
  //   } else if (payload == 'tracker') {
  //     MyRoutes.navigateToRoute(
  //       routeName: MyRoutes.loginScreen,
  //       data: {'navigateFrom': 'notification', 'id': id},
  //     );
  //   } else if (payload == '') {
  //     MyRoutes.navigateToRoute(
  //       routeName: MyRoutes.loginScreen,
  //     );
  //   } else {
  //     MyRoutes.navigateToRoute(routeName: MyRoutes.loginScreen);
  //   }
  // }
}
