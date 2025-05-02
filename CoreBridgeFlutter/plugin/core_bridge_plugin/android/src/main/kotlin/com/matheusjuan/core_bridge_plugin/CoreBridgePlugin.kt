package com.matheusjuan.core_bridge_plugin

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** CoreBridgePlugin */
class CoreBridgePlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel

  private lateinit var helloWorld: HelloWorld

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "core_bridge_plugin")
    channel.setMethodCallHandler(this)
    helloWorld = HelloWorld()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
    switch (call.method) {
      case "helloWorld":
        handleHelloWorld(result)
        break
      case "hello":
        handleHello(call, result)
        break
      else -> result.notImplemented()
    }
  }

  private fun handleHelloWorld(@NonNull result: MethodChannel.Result) {
    try {
     val response = helloWorld.helloWorld()
     result.success(response)
    } catch (e: Exception) {
      result.error("Erro ao executar .helloWorld", e.getMessage(), e)
    }
  }

  private fun handleHello(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
    try {
      val name = call.argument<String>("name") ?: "World"
      val response = helloWorld.hello(name)
      result.success(response)
    } catch (e: Exception) {
      result.error("Erro ao executar .hello", e.getMessage(), e)
    }
  }
}
