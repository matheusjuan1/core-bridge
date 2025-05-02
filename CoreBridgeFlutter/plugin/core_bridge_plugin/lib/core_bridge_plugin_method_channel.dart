import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'core_bridge_plugin_platform_interface.dart';

/// An implementation of [CoreBridgePluginPlatform] that uses method channels.
class MethodChannelCoreBridgePlugin extends CoreBridgePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('core_bridge_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
