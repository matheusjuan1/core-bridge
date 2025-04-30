#!/bin/bash

set -e

echo "🔧 Gerando .aar da CoreBridgeLib..."

cd CoreBridgeLib || exit 1
./gradlew clean assembleDebug

AAR_PATH="./corebridge/build/outputs/aar/corebridge-debug.aar"
DEST_DIR="../CoreBridgeAndroid/app/libs"

echo "📦 Copiando $AAR_PATH para $DEST_DIR..."

mkdir -p "$DEST_DIR"
cp "$AAR_PATH" "$DEST_DIR/core-bridge.aar"

echo "✅ Build e cópia finalizados com sucesso."
