package com.matheusjuan.core_bridge_plugin

import com.matheusjuan.corebridge.CoreBridgeLib
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class CoreBridgePlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "core_bridge_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "helloWorld" -> handleHelloWorld(result)
      "hello" -> handleHello(call, result)
      else -> result.notImplemented()
    }
  }

  private fun handleHelloWorld(result: MethodChannel.Result) {
    try {
      val response = CoreBridgeLib.helloWorld()
      result.success(response)
    } catch (e: Exception) {
      result.error("HELLO_WORLD_ERROR", e.message, null)
    }
  }

  private fun handleHello(call: MethodCall, result: MethodChannel.Result) {
    try {
      val name = call.argument<String>("name") ?: "World"
      val response = CoreBridgeLib.hello(name)
      result.success(response)
    } catch (e: Exception) {
      result.error("HELLO_ERROR", e.message, null)
    }
  }
}