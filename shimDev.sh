sudo growpart /dev/sda4
sudo resize2fs sda4
sudo apt update
sudo apt install snapd default-jdk python3 python3-pip libspa-0.2-bluetooth
sudo snap install code discord spotify chromium
#!/bin/bash

# Define variables
APP_NAME="Beeper"
APP_IMAGE_URL="https://download.beeper.com/linux/appImage/x64"
ICON_URL="https://avatars.githubusercontent.com/u/74791520?s=200&v=4"
SHARE_DIR="$HOME/.local/share"
ICON_DIR="$SHARE_DIR/icons"
DESKTOP_FILE="$SHARE_DIR/applications/$APP_NAME.desktop"
APP_IMAGE_PATH="$HOME/Documents/$APP_NAME.AppImage"

# Create icons directory if it doesn't exist
mkdir -p "$ICON_DIR"

# Download the AppImage
wget "$APP_IMAGE_URL" -O "$APP_IMAGE_PATH"
chmod +x "$APP_IMAGE_PATH"

# Download the icon and save it
ICON_PATH="$ICON_DIR/$APP_NAME.png"
wget "$ICON_URL" -O "$ICON_PATH"

# Create desktop entry
cat << EOF > "$DESKTOP_FILE"
[Desktop Entry]
Version=1.0
Type=Application
Name=$APP_NAME
Comment=Unified chat app for all your messaging apps
Exec="$APP_IMAGE_PATH"
Icon=$ICON_PATH
Terminal=false
Categories=Network;Utility;
EOF

# Make desktop entry executable
chmod +x "$DESKTOP_FILE"

echo "Installation complete. You can now find '$APP_NAME' in your application launcher."
