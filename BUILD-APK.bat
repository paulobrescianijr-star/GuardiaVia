@echo off
chcp 65001 > nul
echo ==========================================
echo    GUARDIAVIA - BUILD APK (CORDOVA)
echo ==========================================
echo.

REM Verificar Node.js
node -v > nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js não encontrado!
    echo Baixe em: https://nodejs.org/
    pause
    exit /b 1
)
echo ✅ Node.js encontrado

REM Verificar Cordova CLI
npx cordova -v > nul 2>&1
if errorlevel 1 (
    echo 📦 Instalando Cordova CLI...
    npm install -g cordova
)
echo ✅ Cordova CLI OK

REM Instalar dependências do projeto
echo 📦 Instalando dependências...
call npm install
if errorlevel 1 (
    echo ❌ Erro ao instalar dependências
    pause
    exit /b 1
)

REM Verificar se a plataforma Android existe
if not exist "platforms\android" (
    echo 🤖 Adicionando plataforma Android...
    npx cordova platform add android@13.0.0
    if errorlevel 1 (
        echo ❌ Erro ao adicionar plataforma Android
        pause
        exit /b 1
    )
) else (
    echo ✅ Plataforma Android já existe
)

REM Verificar plugins
npx cordova plugin list | findstr "cordova-plugin-vibration" > nul
if errorlevel 1 (
    echo 🔌 Instalando plugin de vibração...
    npx cordova plugin add cordova-plugin-vibration
)

npx cordova plugin list | findstr "cordova-plugin-geolocation" > nul
if errorlevel 1 (
    echo 🔌 Instalando plugin de GPS...
    npx cordova plugin add cordova-plugin-geolocation --variable GPS_REQUIRED="true"
)

npx cordova plugin list | findstr "cordova-plugin-bluetoothle" > nul
if errorlevel 1 (
    echo 🔌 Instalando plugin de Bluetooth...
    npx cordova plugin add cordova-plugin-bluetoothle
)

npx cordova plugin list | findstr "cordova-plugin-whitelist" > nul
if errorlevel 1 (
    echo 🔌 Instalando plugin whitelist...
    npx cordova plugin add cordova-plugin-whitelist
)

echo.
echo ==========================================
echo 🔨 BUILD DO APK (DEBUG - ASSINADO)
echo ==========================================
echo.

REM Build debug (já vem assinado com keystore debug)
npx cordova build android --debug

if errorlevel 1 (
    echo ❌ Erro no build!
    pause
    exit /b 1
)

echo.
echo ==========================================
echo ✅ APK GERADO COM SUCESSO!
echo ==========================================
echo.
echo 📁 Local do APK:
echo platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo 📱 Para instalar no celular:
echo 1. Ative "Opções do Desenvolvedor" no Android
echo 2. Ative "Instalação via USB" ou "Depuração USB"
echo 3. Conecte o celular no PC via USB
echo 4. Execute: adb install platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo 🌐 Ou envie o APK pelo WhatsApp/Telegram
echo e instale direto no celular.
echo.
echo ==========================================
pause
