import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CoreBridgeApp());
}

class CoreBridgeApp extends StatefulWidget {
  const CoreBridgeApp({super.key});

  @override
  State<CoreBridgeApp> createState() => _CoreBridgeAppState();
}

class _CoreBridgeAppState extends State<CoreBridgeApp> {
  static const platform = MethodChannel('core_bridge_plugin');

  String _message = 'Carregando...';

  @override
  void initState() {
    super.initState();
    _getHelloMessage();
  }

  Future<void> _getHelloMessage() async {
    try {
      final String result = await platform.invokeMethod('hello', {
        'name': 'Flutter',
      });
      setState(() {
        _message = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        _message = 'Erro: ${e.message}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoreBridgeLib',
      home: Scaffold(
        appBar: AppBar(title: const Text('CoreBridgeLib')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Mensagem da ponte nativa:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 12),
                Text(_message, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
