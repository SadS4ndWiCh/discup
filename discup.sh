#!/usr/bin/bash

# Exit codes
ERR_MUST_BE_ROOT=1
ERR_COMPRESSED_FILE_NOT_FOUND=2

# Essentials Paths
THIRD_PARTY_PROGRAMS=/opt
BINARIES_PATH=/usr/local/bin
APPLICATIONS_PATH=/usr/share/applications

# Discord paths
DISCORD_FOLDER_PATH=$THIRD_PARTY_PROGRAMS/Discord

DISCORD_BINARY_FILE_PATH=$DISCORD_FOLDER_PATH/Discord
DISCORD_BINARY_LINK_FILE_PATH=$BINARIES_PATH/discord

DISCORD_DESKTOP_CONFIG_FILE_PATH=$APPLICATIONS_PATH/discord.desktop

# Script parameters
UPDATE_VERSION_COMPRESSED_FILE_PATH=$1

if [[ "$EUID" -ne 0 ]]; then
    echo "[-] Command must be executed as root."
    exit $ERR_MUST_BE_ROOT
fi

if [[ ! -f $UPDATE_VERSION_COMPRESSED_FILE_PATH ]]; then
    echo "[-] Compressed file not found."
    exit $ERR_COMPRESSED_FILE_NOT_FOUND
fi

if [[ -d $DISCORD_FOLDER_PATH ]]; then
    echo "[*] Removing previous Discord version."
    sudo rm -fr $DISCORD_FOLDER_PATH
    echo "[+] Removed current Discord version folder."
fi

echo "[*] Extracting Discord to $DISCORD_PARENT_PATH"
sudo tar -xvzf $UPDATE_VERSION_COMPRESSED_FILE_PATH -C $THIRD_PARTY_PROGRAMS
echo "[+] Discord extracted to $DISCORD_PARENT_PATH"

if [[ ! -f $DISCORD_DESKTOP_CONFIG_FILE_PATH ]]; then
    echo "[*] Creating Discord desktop config file."

    cat > $DISCORD_DESKTOP_CONFIG_FILE_PATH <<EOF
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=$DISCORD_BINARY_FILE_PATH
Icon=/opt/discord/discord.png
Type=Application
Categories=Network;InstantMessaging;
Path=$BINARIES_PATH
EOF
    echo "[+] Created Discord desktop config file."
fi

if [[ -f $DISCORD_BINARY_LINK_FILE_PATH ]]; then
    echo "[*] Unlinking previous version."
    sudo unlink $DISCORD_BINARY_LINK_FILE_PATH
    echo "[+] Unlinked file."
fi

echo "[*] Linking new binary file version."
sudo ln -s $DISCORD_BINARY_FILE_PATH $DISCORD_BINARY_LINK_FILE_PATH
echo "[+] Binary file linked."

echo "[+] Discord successfuly updated!"
echo "[+] Type `discord` or open from desktop."
