import 'package:flutter_test/flutter_test.dart';
import 'package:core_bridge_plugin/core_bridge_plugin.dart';
import 'package:core_bridge_plugin/core_bridge_plugin_platform_interface.dart';
import 'package:core_bridge_plugin/core_bridge_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCoreBridgePluginPlatform
    with MockPlatformInterfaceMixin
    implements CoreBridgePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CoreBridgePluginPlatform initialPlatform = CoreBridgePluginPlatform.instance;

  test('$MethodChannelCoreBridgePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCoreBridgePlugin>());
  });

  test('getPlatformVersion', () async {
    CoreBridgePlugin coreBridgePlugin = CoreBridgePlugin();
    MockCoreBridgePluginPlatform fakePlatform = MockCoreBridgePluginPlatform();
    CoreBridgePluginPlatform.instance = fakePlatform;

    expect(await coreBridgePlugin.getPlatformVersion(), '42');
  });
}
