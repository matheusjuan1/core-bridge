import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'core_bridge_plugin_method_channel.dart';

abstract class CoreBridgePluginPlatform extends PlatformInterface {
  /// Constructs a CoreBridgePluginPlatform.
  CoreBridgePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static CoreBridgePluginPlatform _instance = MethodChannelCoreBridgePlugin();

  /// The default instance of [CoreBridgePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelCoreBridgePlugin].
  static CoreBridgePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CoreBridgePluginPlatform] when
  /// they register themselves.
  static set instance(CoreBridgePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
