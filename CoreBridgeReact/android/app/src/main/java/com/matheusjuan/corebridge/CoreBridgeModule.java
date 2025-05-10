package com.matheusjuan.corebridge;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

public class CoreBridgeModule extends ReactContextBaseJavaModule {

    public CoreBridgeModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "CoreBridge";
    }

    @ReactMethod
    public void helloWorld(Promise promise) {
        try {
            String result = new CoreBridgeLib().helloWorld();
            promise.resolve(result);
        } catch (Exception e) {
            promise.reject("ERR_HELLO", e);
        }
    }

    @ReactMethod
    public void hello(String name, Promise promise) {
        try {
            String result = new CoreBridgeLib().hello(name);
            promise.resolve(result);
        } catch (Exception e) {
            promise.reject("ERR_HELLO_NAME", e);
        }
    }
}
