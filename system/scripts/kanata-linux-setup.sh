#!/usr/bin/sh

# ==============================================================================
# Script to set up Kanata with dedicated user and hardened systemd service
# ==============================================================================

# CONFIGURATION
# Relative paths from $HOME to your Kanata configuration files
KANATA_CONFIG_REL_PATHS=(
    "path/to/config-1.kbd"
    "path/to/config-2.kbd"
)

# Target directory for system-level configuration
KANATA_ETC_DIR="/etc/kanata"

# Kanata version to download
KANATA_VERSION="v1.7.0"

# Dedicated user/group names
KANATA_USER="kanata"
UINPUT_GROUP="uinput"

# FUNCTION TO PRINT MESSAGES
echoinfo() {
    echo "[INFO] $1"
}
echoerror() {
    echo "[ERROR] $1" >&2
}

# CHECK FOR ROOT/SUDO
if [ "$(id -u)" -ne 0 ]; then
  echoerror "This script must be run with sudo or as root."
  exit 1
fi

# VALIDATE AND RESOLVE CONFIG PATHS FROM USER HOME
SOURCE_CONFIGS=()

for rel_path in "${KANATA_CONFIG_REL_PATHS[@]}"; do
    config_src="$HOME/$rel_path"

    # Fallback to SUDO_USER home if needed
    if [ ! -f "$config_src" ] && [ -n "$SUDO_USER" ]; then
        sudo_user_home=$(getent passwd "$SUDO_USER" | cut -d: -f6)
        if [ -n "$sudo_user_home" ] && [ -f "$sudo_user_home/$rel_path" ]; then
            config_src="$sudo_user_home/$rel_path"
        fi
    fi

    if [ ! -f "$config_src" ]; then
        echoerror "Kanata config file not found: $rel_path"
        exit 1
    fi

    echoinfo "Validated source config: $config_src"
    SOURCE_CONFIGS+=("$config_src")
done

echoinfo "Starting Kanata hardened setup..."

#========================
# STEP 1: Create User/Group
#========================
echoinfo "Creating group '$UINPUT_GROUP' (if it doesn't exist)..."
groupadd "$UINPUT_GROUP" || echoinfo "Group '$UINPUT_GROUP' likely already exists."

echoinfo "Creating user '$KANATA_USER' (if it doesn't exist)..."
useradd --system --no-create-home --groups input,"$UINPUT_GROUP" --shell /bin/false --user-group "$KANATA_USER" || echoinfo "User '$KANATA_USER' likely already exists."

#========================
# STEP 2: Create udev Rule
#========================
echoinfo "Creating udev rule for /dev/uinput..."
echo "KERNEL==\"uinput\", MODE=\"0660\", GROUP=\"$UINPUT_GROUP\", OPTIONS+=\"static_node=uinput\"" > /etc/udev/rules.d/50-kanata.rules

#========================
# STEP 3: Deploy Configuration Files to /etc/kanata
#========================
echoinfo "Preparing configuration directory at $KANATA_ETC_DIR..."
mkdir -p "$KANATA_ETC_DIR"

SYSTEM_CONFIG_PATHS=()

for src in "${SOURCE_CONFIGS[@]}"; do
    filename=$(basename "$src")
    dest="$KANATA_ETC_DIR/$filename"
    
    echoinfo "Copying $src -> $dest"
    cp "$src" "$dest"
    SYSTEM_CONFIG_PATHS+=("$dest")
done

# Restrict permissions so only root and the kanata user/group can read them
chown -R root:"$KANATA_USER" "$KANATA_ETC_DIR"
chmod 750 "$KANATA_ETC_DIR"
chmod 640 "$KANATA_ETC_DIR"/*

#========================
# STEP 4: Download and Install Kanata (Optional)
#========================
KANATA_BIN_PATH=""
DOWNLOAD_KANATA=false

# Check if kanata is already installed on the system PATH
if command -v kanata &> /dev/null; then
    EXISTING_PATH="$(command -v kanata)"
    echoinfo "Found existing Kanata binary at: $EXISTING_PATH"
fi

read "REPLY?Do you want to download/update the Kanata binary (${KANATA_VERSION})? (y/N): "
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    DOWNLOAD_KANATA=true
fi

if [ "$DOWNLOAD_KANATA" = true ]; then
    KANATA_BIN_PATH="/usr/local/bin/kanata"
    KANATA_URL="https://github.com/jtroo/kanata/releases/download/${KANATA_VERSION}/kanata"
    
    echoinfo "Stopping kanata.service (if running) before download..."
    systemctl stop kanata.service > /dev/null 2>&1 || true

    echoinfo "Downloading Kanata ${KANATA_VERSION} from ${KANATA_URL}..."
    curl -fSL -o "$KANATA_BIN_PATH" "$KANATA_URL"
    if [ $? -ne 0 ]; then
        echoerror "Failed to download Kanata. Check URL or network connection."
        exit 1
    fi

    echoinfo "Setting permissions on ${KANATA_BIN_PATH}..."
    chown root:"$KANATA_USER" "$KANATA_BIN_PATH"
    chmod 754 "$KANATA_BIN_PATH"
else
    echoinfo "Skipping Kanata binary download."

    if [ -n "$EXISTING_PATH" ]; then
        KANATA_BIN_PATH="$EXISTING_PATH"
    else
        KANATA_BIN_PATH="/usr/local/bin/kanata"
    fi

    if [ ! -f "$KANATA_BIN_PATH" ]; then
        echoerror "Kanata binary not found at $KANATA_BIN_PATH and download was skipped."
        exit 1
    fi
fi

echoinfo "Using Kanata binary at: $KANATA_BIN_PATH"

#========================
# STEP 5: Build ExecStart argument string for multiple configs
#========================
EXEC_START_ARGS="$KANATA_BIN_PATH --quiet"
for cfg in "${SYSTEM_CONFIG_PATHS[@]}"; do
    EXEC_START_ARGS+=" --cfg $cfg"
done

#========================
# STEP 6: Create Systemd Service Unit
#========================
echoinfo "Creating systemd service file /etc/systemd/system/kanata.service..."
cat << EOF > /etc/systemd/system/kanata.service
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata
Wants=modprobe@uinput.service
After=modprobe@uinput.service

[Service]
Type=simple
User=$KANATA_USER
Group=$KANATA_USER
ExecStart=$EXEC_START_ARGS
Restart=no

# Security Sandboxing
CapabilityBoundingSet=
DeviceAllow=/dev/uinput rw
DeviceAllow=char-input
DeviceAllow=/dev/stdin
DevicePolicy=strict
PrivateDevices=true
BindPaths=/dev/uinput
BindReadOnlyPaths=/dev/stdin
BindReadOnlyPaths=/dev/input/
InaccessiblePaths=/dev/shm
LockPersonality=true
NoNewPrivileges=true
PrivateTmp=true
PrivateNetwork=true
PrivateUsers=true
#ProtectClock=true
ProtectHome=true
ProtectHostname=true
ProtectKernelTunables=true
ProtectKernelModules=true
ProtectKernelLogs=true
ProtectSystem=strict
ProtectControlGroups=true
# Allow only Unix sockets, deny others like network
RestrictAddressFamilies=AF_UNIX
RestrictNamespaces=true
SystemCallArchitectures=native
SystemCallErrorNumber=EPERM
SystemCallFilter=@system-service
SystemCallFilter=~@privileged @resources
RemoveIPC=true
IPAddressDeny=any
RestrictSUIDSGID=true
RestrictRealtime=true
MemoryDenyWriteExecute=true
UMask=0077

[Install]
WantedBy=multi-user.target
EOF

#========================
# STEP 7: Reload Systemd, Enable & Start Service
#========================
echoinfo "Reloading systemd daemon..."
systemctl daemon-reload

echoinfo "Enabling kanata.service..."
systemctl enable kanata.service

echoinfo "Starting/Restarting kanata.service..."
systemctl restart kanata.service

echoinfo "-----------------------------------------------------"
echoinfo "Kanata setup script finished!"
echoinfo "Configs deployed to: $KANATA_ETC_DIR"
echoinfo "Please REBOOT your system if this is the first time setting up udev rules."
echoinfo "Check status with: systemctl status kanata.service"
echoinfo "-----------------------------------------------------"

exit 0
