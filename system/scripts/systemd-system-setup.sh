#!/usr/bin/sh
set -euo pipefail

SERVICES=(
    "swayosd-libinput-backend.service"
)

action="${1:-}"

enable_services() {
    echo "⚙️ Checking and enabling systemd system services..."
    systemctl daemon-reload

    for service in "${SERVICES[@]}"; do
        # Check if the service is already enabled
        if systemctl is-enabled "$service" >/dev/null 2>&1; then
            echo "  [INFO] $service is already enabled."
        else
            echo "  [+] Enabling and starting $service..."
            systemctl enable --now "$service"
        fi
    done
    echo "✨ System Services check & enable complete."
}

disable_services() {
    echo "⚙️ Checking and disabling systemd system services..."

    for service in "${SERVICES[@]}"; do
        # Check if the service is currently enabled or active
        if systemctl is-enabled "$service" >/dev/null 2>&1 || systemctl is-active "$service" >/dev/null 2>&1; then
            echo "  [-] Stopping and disabling $service..."
            systemctl disable --now "$service" || true
        else
            echo "  [INFO] $service is already disabled/inactive."
        fi
    done
    echo "🧹 System services disable complete."
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
