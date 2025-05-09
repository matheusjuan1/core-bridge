package com.matheusjuan.corebridge;

import com.matheusjuan.corebridge.bridge.LibraryBridge;

public class CoreBridgeLib {

    public static String helloWorld() {
        return LibraryBridge.INSTANCE.HelloWorld();
    }

    public static String hello(String name) {
        return LibraryBridge.INSTANCE.Hello(name);
    }
}
