import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vendor_app/call_listner.dart';
import 'package:vendor_app/helper/themes.dart';
import 'package:vendor_app/routes/routes.dart';
import 'firebase_options.dart';
import 'modules/dashboard/call_state.dart';

@pragma('vm:entry-point')
Future<void> flutterBackgroundHandler(RemoteMessage message) async {
  debugPrint("Notification received in background: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(flutterBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = MethodChannel('com.example.vendor_app/call_logs');
  String incomingNumber = "Waiting for call...";
  @override
  void initState() {
    super.initState();
    checkAllPermission();
    platform.setMethodCallHandler((call) async {
      if (call.method == "incomingCall") {
        setState(() {
          incomingNumber = call.arguments;
          print (incomingNumber);

        });
      }
    });
  }

  checkAllPermission() async {
    await checkAndRequestPhoneStatePermission();
    await checkCall();
    await CustomCallState().requestPermission();
  }

  Future<void> checkAndRequestPhoneStatePermission() async {
    if (await Permission.phone.request().isGranted) {
      debugPrint('Phone State permission granted');
    } else {
      debugPrint('Phone State permission denied');
    }
  }

  checkCall() async {
    var num = await CallStateListener.getCallStatus();

    print('CallStateListener $num');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: 'Vendor App',
      theme: CustomTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.splashScreen,
      getPages: MyRoutes.viewPages,
    );
  }
}
