#!/bin/bash

set -e

echo "🔧 Gerando .aar da CoreBridgeLib..."

cd CoreBridgeLib || exit 1
./gradlew clean assembleDebug
cd ..

AAR_PATH="CoreBridgeLib/corebridge/build/outputs/aar/corebridge-debug.aar"

DEST_ANDROID="CoreBridgeAndroid/app/libs"
DEST_FLUTTER="CoreBridgeFlutter/plugin/core_bridge_plugin/android/libs"
DEST_REACT="CoreBridgeReact/android/libs"

echo "📦 Copiando $AAR_PATH para $DEST_ANDROID..."
mkdir -p "$DEST_ANDROID"
cp "$AAR_PATH" "$DEST_ANDROID/core-bridge.aar"

echo "📦 Copiando $AAR_PATH para $DEST_FLUTTER..."
mkdir -p "$DEST_FLUTTER"
cp "$AAR_PATH" "$DEST_FLUTTER/core-bridge.aar"

echo "📦 Copiando $AAR_PATH para $DEST_REACT..."
mkdir -p "$DEST_REACT"
cp "$AAR_PATH" "$DEST_REACT/core-bridge.aar"

echo "✅ Build e cópias finalizadas com sucesso."
