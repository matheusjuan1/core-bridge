package com.matheusjuan.corebridge.bridge;

import com.sun.jna.Library;
import com.sun.jna.Native;
import com.sun.jna.ptr.IntByReference;

import java.nio.ByteBuffer;

/**
 * LibraryBridge é a interface que lista os métodos do componente CoreBridge
 */
public interface LibraryBridge extends Library {

    LibraryBridge INSTANCE = Native.load("corebridge", LibraryBridge.class);

    String HelloWorld();

    String Hello(String name);

    int HelloByteBuffer(ByteBuffer buffer, IntByReference size);
}
