package com.matheusjuan.corebridge;

import android.util.Log;

import com.matheusjuan.corebridge.bridge.LibraryBridge;
import com.sun.jna.ptr.IntByReference;

import java.nio.ByteBuffer;

public class CoreBridgeLib {

    public static String helloWorld() {
        return LibraryBridge.INSTANCE.HelloWorld();
    }

    public static String hello(String name) {
        return LibraryBridge.INSTANCE.Hello(name);
    }

    public static String helloByteBuffer() {
        IntByReference size = new IntByReference(1024);
        ByteBuffer buffer = ByteBuffer.allocate(1024);
        Log.i("CoreBridgeLib",  "" + LibraryBridge.INSTANCE.HelloByteBuffer(buffer,size));
        return buffer.toString();
    }
}
