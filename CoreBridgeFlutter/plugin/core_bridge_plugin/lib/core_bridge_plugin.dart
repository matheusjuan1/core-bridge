
import 'core_bridge_plugin_platform_interface.dart';

class CoreBridgePlugin {
  static const MethodChannel _channel = MethodChannel('core_bridge_plugin');

  Future<String?> getPlatformVersion() {
    return CoreBridgePluginPlatform.instance.getPlatformVersion();
  }

  static Future<String?> helloWorld() async {
    final result = await _channel.invokeMethod<String>('helloWorld');
    return result ?? '';
  }

  static Future<String?> hello(String name) async {
    final result = await _channel.invokeMethod<String>('hello', {'name': name});
    return result ?? '';
  }
}
