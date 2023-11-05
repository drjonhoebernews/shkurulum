#!/bin/bash

# Script başlatılıyor.
echo "Node.js ve izlebot uygulama kurulum scripti başlatılıyor..."

# nvm yükleyin ve source komutu ile etkinleştirin
echo "Node.js yükleniyor..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.nvm/nvm.sh

# Node.js'in en son sürümünü yükleyin (nvm kullanarak)
nvm install node
nvm use node

# Proje dizinine gitmeden önce, izlebot deposunu klonlayın
echo "izlebot deposu GitHub'dan klonlanıyor..."
git clone https://github.com/drjonhoebernews/izlebot.git
cd izlebot

# Bağımlılıkları yükleyin
echo "Uygulama bağımlılıkları yükleniyor..."
npm install

# Çalıştırılabilir Node.js uygulama dosyası için izin ver
chmod +x index.js # Varsayılan giriş dosyanız index.js ise

# Uygulamanın çalıştırılabilir olduğundan emin olun ve sistemde doğru yolu gösterin
EXEC_PATH=$(pwd)/index.js
DESKTOP_ENTRY_PATH=~/.local/share/applications/izlebot.desktop
ICON_PATH=$(pwd)/icon.png # Sizin ikon dosyanızın yolu

# .desktop dosyası oluşturun
echo "Masaüstü girişi oluşturuluyor..."
cat > $DESKTOP_ENTRY_PATH <<EOL
[Desktop Entry]
Name=izlebot
Comment=Run izlebot application
Exec=$EXEC_PATH
Icon=$ICON_PATH
Terminal=true
Type=Application
Categories=Utility;
EOL

# .desktop dosyasına çalıştırma izinleri ver
chmod +x $DESKTOP_ENTRY_PATH

echo "Kurulum tamamlandı. Uygulamanızı uygulamalar menüsünden veya masaüstündeki simge ile başlatabilirsiniz."
