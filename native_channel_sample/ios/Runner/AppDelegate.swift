import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller = window?.rootViewController as! FlutterViewController
         let methodChannel = FlutterMethodChannel(name: "native/sample", binaryMessenger: controller.binaryMessenger)
         
         methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
             guard call.method == "get" else {
                 result(FlutterMethodNotImplemented)
                 return
             }
             let count = NSUserDefaults.standard.integer(forKey: "count")
             result(count)
         }
      
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
