@echo off
setlocal

echo 🔧 Gerando .aar da CoreBridgeLib...

cd CoreBridgeLib
call gradlew clean assembleDebug || exit /b 1
cd ..

set AAR_PATH=CoreBridgeLib\corebridge\build\outputs\aar\corebridge-debug.aar

set DEST_ANDROID=CoreBridgeAndroid\app\libs
set DEST_FLUTTER=CoreBridgeFlutter\plugin\core_bridge_plugin\android\libs
set DEST_REACT=CoreBridgeReact\android\libs

echo 📦 Copiando %AAR_PATH% para %DEST_ANDROID%...
if not exist %DEST_ANDROID% mkdir %DEST_ANDROID%
copy /Y %AAR_PATH% %DEST_ANDROID%\core-bridge.aar

echo 📦 Copiando %AAR_PATH% para %DEST_FLUTTER%...
if not exist %DEST_FLUTTER% mkdir %DEST_FLUTTER%
copy /Y %AAR_PATH% %DEST_FLUTTER%\core-bridge.aar

echo 📦 Copiando %AAR_PATH% para %DEST_REACT%...
if not exist %DEST_REACT% mkdir %DEST_REACT%
copy /Y %AAR_PATH% %DEST_REACT%\core-bridge.aar

echo ✅ Build e cópias finalizadas com sucesso.
