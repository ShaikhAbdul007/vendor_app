import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
     let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: "com.example.vendor_app/call",
                                                 binaryMessenger: controller.binaryMessenger)
        
        methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "getCallDetails" {
                self.getCallDetails { details in
                    result(details)
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        // CallKit Setup for tracking calls
        callObserver = CXCallObserver()
        callObserver?.setDelegate(self.callKitDelegate)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
