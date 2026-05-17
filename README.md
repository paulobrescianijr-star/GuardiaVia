# GuardiaVia - Projeto Cordova (APK Nativo)

## 📦 Estrutura do Projeto

```
GuardiaVia-Cordova/
├── .github/
│   └── workflows/
│       └── build.yml          # Workflow do GitHub Actions
├── config.xml                 # Configuração do Cordova
├── package.json               # Dependências
├── .gitignore                 # Arquivos ignorados pelo Git
├── BUILD-APK.bat              # Script de build local
├── index.html                 # App principal
├── manifest.json              # PWA manifest
├── sw.js                      # Service Worker
├── icon.svg                   # Ícone do app
└── README.md                  # Este arquivo
```

## 🚀 Build Automático via GitHub Actions

### Passo 1: Criar conta no GitHub

1. Acesse [github.com](https://github.com)
2. Clique em **"Sign up"** (Cadastrar)
3. Preencha email, senha e username
4. Confirme seu email

### Passo 2: Criar repositório

1. No GitHub, clique no **+** (canto superior direito)
2. **"New repository"**
3. Nome: `GuardiaVia`
4. Descrição: `Proteção veicular e saúde em tempo real`
5. Marque **"Public"** (gratuito)
6. Clique em **"Create repository"**

### Passo 3: Preparar pasta local

1. Abra a pasta do projeto:
```
C:\Users\paulo\Desktop\GuardiaVia-Cordova
```

2. Verifique se contém:
   - `.github/workflows/build.yml`
   - `config.xml`
   - `package.json`
   - `index.html`
   - `manifest.json`
   - `sw.js`
   - `icon.svg`
   - `.gitignore`

### Passo 4: Inicializar Git e enviar

Abra o **Prompt de Comando** (CMD) ou **PowerShell**:

```bash
# Navegar para a pasta
cd C:\Users\paulo\Desktop\GuardiaVia-Cordova

# Inicializar Git
git init

# Adicionar todos os arquivos
git add .

# Commit inicial
git commit -m "Primeiro commit - GuardiaVia v2.0"

# Conectar ao GitHub (substitua SEU-USUARIO pelo seu username)
git remote add origin https://github.com/SEU-USUARIO/GuardiaVia.git

# Enviar para o GitHub
git push -u origin main
```

> **Nota:** Se der erro no `git push`, tente:
> ```bash
> git branch -M main
> git push -u origin main
> ```

### Passo 5: Verificar build automático

1. No GitHub, acesse seu repositório
2. Clique na aba **"Actions"**
3. Você verá o workflow **"Build GuardiaVia APK"** rodando
4. Aguarde ~5-10 minutos
5. Quando terminar, clique no workflow verde
6. Role para baixo até **"Artifacts"**
7. Baixe o APK:
   - `GuardiaVia-APK-Debug` (versão de teste)
   - `GuardiaVia-APK-Release` (versão final)

### Passo 6: Baixar APK

1. Clique no nome do artifact
2. O ZIP será baixado automaticamente
3. Extraia o ZIP
4. Instale o APK no celular

---

## 📱 Instalação no Celular

### Opção 1: APK Debug (teste)
1. Envie `app-debug.apk` pelo WhatsApp/Telegram
2. No celular, toque no arquivo
3. Permita instalação de fontes desconhecidas
4. Instale

### Opção 2: APK Release (publicação)
1. O release vem **não assinado**
2. Para publicar na Play Store, precisa assinar:
```bash
# Gerar keystore
keytool -genkey -v -keystore guardiavia.keystore -alias guardiavia -keyalg RSA -keysize 2048 -validity 10000

# Assinar APK
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore guardiavia.keystore app-release-unsigned.apk guardiavia

# Alinhar APK
zipalign -v 4 app-release-unsigned.apk GuardiaVia-release.apk
```

---

## 🔧 Build Local (sem GitHub)

### Pré-requisitos
- Node.js 18+: https://nodejs.org/
- Java JDK 17: https://adoptium.net/
- Android Studio: https://developer.android.com/studio

### Comandos
```bash
# Instalar Cordova
npm install -g cordova

# Navegar para pasta
cd GuardiaVia-Cordova

# Instalar dependências
npm install

# Adicionar Android
cordova platform add android@13.0.0

# Instalar plugins
cordova plugin add cordova-plugin-vibration
cordova plugin add cordova-plugin-geolocation --variable GPS_REQUIRED="true"
cordova plugin add cordova-plugin-bluetoothle
cordova plugin add cordova-plugin-whitelist

# Build
cordova build android --debug
```

---

## ✅ Funcionalidades Nativas

| Funcionalidade | Plugin Cordova | Status |
|----------------|----------------|--------|
| **Vibração** | `cordova-plugin-vibration` | ✅ Motor nativo |
| **GPS** | `cordova-plugin-geolocation` | ✅ GPS nativo |
| **Bluetooth LE** | `cordova-plugin-bluetoothle` | ✅ BLE nativo |
| **Notificações** | Nativo Android | ✅ Push nativo |

---

## 🛡️ Permissões no Android

O `config.xml` já configura automaticamente:
- `android.permission.VIBRATE`
- `android.permission.ACCESS_FINE_LOCATION`
- `android.permission.BLUETOOTH_CONNECT`
- `android.permission.BLUETOOTH_SCAN`
- `android.permission.POST_NOTIFICATIONS`

---

## 📞 Suporte

Desenvolvido por: **Paulo Sergio Bresciani Junior**
Versão: **2.0.0**
