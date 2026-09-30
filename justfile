# Print help
default:
    @just --list

# Orchestrates the entire machine configuration
setup: check-tools safeguard sync
    @echo "✨ Machine setup completed successfully!"

# Check all necessary tools and list any missing ones at once
check-tools:
	#!/usr/bin/env bash
	echo "🔍 Checking necessary tools..."
	MISSING=""

	for tool in yolk rustup cargo; do
		if ! command -v "$tool" >/dev/null 2>&1; then
			MISSING="$MISSING $tool"
		fi
	done

	if [ -n "$MISSING" ]; then
		echo ""
		echo "❌ Error: The following required tools are missing or not runnable:$MISSING"
		echo "Please install them all, then re-run 'just setup'."
		exit 1
	else
		echo "✅ All required tools are available."
	fi

# Safeguard dotfiles using yolk
safeguard:
    @echo "🛡️ Running yolk safeguard..."
    yolk safeguard --yolk-dir ~/.dotfiles

# Sync and symlink dotfiles content to their destinations
sync:
    @echo "🔗 Running yolk sync..."
    yolk sync --yolk-dir ~/.dotfiles

# Checkhealth for system
checkhealth: package-linux
	@echo "Checking system health..."

package-linux:
	@echo "Checking linux packages..."
	@zsh ./system/scripts/missing-packages-linux.sh ./export/packages/linux

# package-flatpak:
# 	@echo "Checking flatpak packages..."
# 	@zsh ./system/scripts/missing-packages.sh ./export/packages/flatpak

systemd-setup: systemd-user-setup systemd-system-setup
	@echo "Running systemd setup..."

systemd-user-setup:
	@echo "Running systemd user setup..."
	@zsh ./system/scripts/systemd-user-setup.sh enable

systemd-system-setup:
	@echo "Running systemd system setup..."
	@zsh ./system/scripts/systemd-system-setup.sh enable

systemd-prune: systemd-user-prune systemd-system-prune
	@echo "Prunning systemd setup..."

systemd-user-prune:
	@echo "Prunning systemd user setup..."
	@zsh ./system/scripts/systemd-user-setup.sh disable

systemd-system-prune:
	@echo "Prunning systemd system setup..."
	@zsh ./system/scripts/systemd-system-setup.sh disable
