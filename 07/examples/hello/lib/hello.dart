import 'dart:async';

import 'package:flutter/services.dart';

class Hello {
  static const MethodChannel _channel = const MethodChannel('hello');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> updatedString(String initialString) async {
    return _channel.invokeMethod('updateString', initialString);
  }
}
