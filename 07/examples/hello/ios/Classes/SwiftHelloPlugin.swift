import Flutter
import UIKit

public class SwiftHelloPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "hello", binaryMessenger: registrar.messenger())
    let instance = SwiftHelloPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
    case "updateString":
        updateString(call, result: result)
    default:
        result(FlutterMethodNotImplemented)
    }
  }

    private func updateString(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let initialString = call.arguments as? String {
            let updatedString = initialString + " was updated in iOS " + UIDevice.current.systemVersion;
            result(updatedString)
        }
    }
}
