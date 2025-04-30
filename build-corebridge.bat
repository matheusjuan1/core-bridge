@echo off
setlocal

echo 🔧 Gerando .aar da CoreBridgeLib...

cd CoreBridgeLib
call gradlew clean assembleDebug || exit /b 1
cd ..

set AAR_PATH=CoreBridgeLib\corebridge\build\outputs\aar\corebridge-debug.aar
set DEST_DIR=CoreBridgeAndroid\app\libs

echo 📦 Copiando %AAR_PATH% para %DEST_DIR%...

if not exist %DEST_DIR% mkdir %DEST_DIR%
copy /Y %AAR_PATH% %DEST_DIR%\core-bridge.aar

echo ✅ Build e cópia finalizados com sucesso.
