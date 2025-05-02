import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_bridge_plugin/core_bridge_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCoreBridgePlugin platform = MethodChannelCoreBridgePlugin();
  const MethodChannel channel = MethodChannel('core_bridge_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
