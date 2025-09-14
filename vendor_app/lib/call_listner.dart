import 'package:flutter/services.dart';

class CallStateListener {
  static const MethodChannel _channel = MethodChannel('com.example.vendor_app/call');

  // Method to get current call number
  static Future<String?> getCallStatus() async {
    try {
      final String? number = await _channel.invokeMethod('getCallStatus');
      return number;
    } catch (e) {
      print("Error getting call status: $e");
      return null;
    }
  }
}
