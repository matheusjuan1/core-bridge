package com.matheusjuan.corebridge.android.core

import com.matheusjuan.corebridge.HelloWorld

class CoreBridgeManager private constructor() {
    companion object {
        val instance: HelloWorld by lazy { HelloWorld() }
    }
}