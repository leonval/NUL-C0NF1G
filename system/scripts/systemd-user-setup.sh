#!/usr/bin/sh
set -euo pipefail

SERVICES=(
    "keepassxc.service"
    "swaybg.service"
    "waybar.service"
)

action="${1:-}"

enable_services() {
    echo "⚙️ Checking and enabling systemd user services..."
    systemctl --user daemon-reload

    for service in "${SERVICES[@]}"; do
        # Check if the service is already enabled
        if systemctl --user is-enabled "$service" >/dev/null 2>&1; then
            echo "  [INFO] $service is already enabled."
        else
            echo "  [+] Enabling and starting $service..."
            systemctl --user enable --now "$service"
        fi
    done
    echo "✨ Services check & enable complete."
}

disable_services() {
    echo "⚙️ Checking and disabling systemd user services..."

    for service in "${SERVICES[@]}"; do
        # Check if the service is currently enabled or active
        if systemctl --user is-enabled "$service" >/dev/null 2>&1 || systemctl --user is-active "$service" >/dev/null 2>&1; then
            echo "  [-] Stopping and disabling $service..."
            systemctl --user disable --now "$service" || true
        else
            echo "  [INFO] $service is already disabled/inactive."
        fi
    done
    echo "🧹 Services disable complete."
}

case "$action" in
    enable)
        enable_services
        ;;
    disable)
        disable_services
        ;;
    *)
        echo "Usage: $0 {enable|disable}"
        exit 1
        ;;
esac
