# Partition Resizing

To resize partitions and the associated filesystem:

```bash
sudo growpart /dev/sda 4       # Expands partition 4 on /dev/sda
sudo resize2fs /dev/sda4       # Resizes filesystem on /dev/sda4
```

# Dependency Installation

To install necessary dependencies:

```bash
sudo apt update
sudo apt install default-jdk python3 python3-pip libspa-0.2-bluetooth
```

# Spotify Installation

To install Spotify:

```bash
wget -qO - https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list > /dev/null
sudo apt-get update && sudo apt-get install spotify-client
```

# Beeper Installation

```bash
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
```
