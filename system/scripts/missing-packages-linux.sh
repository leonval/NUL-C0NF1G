#!/usr/bin/env zsh

# ==============================================================================
# Smart Package & Binary Checker
# Checks system package managers, AUR variations, and system $PATH binaries.
# ==============================================================================

if [[ -z "$1" ]]; then
    echo "[ERROR] Please provide a package list file." >&2
    echo "Usage: $0 <path_to_package_list>" >&2
    exit 1
fi

INPUT_FILE="$1"

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "[ERROR] File not found: $INPUT_FILE" >&2
    exit 1
fi

if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    OS_ID="$ID"
    OS_LIKE="${ID_LIKE:-$ID}"
else
    echo "[ERROR] Cannot detect OS. /etc/os-release missing." >&2
    exit 1
fi

if [[ -n "$PAGER" ]]; then
    PAGER_CMD="$PAGER"
elif command -v less &>/dev/null; then
    PAGER_CMD="less -FRX"
else
    PAGER_CMD="more"
fi

# Read input list into an array
typeset -a INPUT_PACKAGES
INPUT_PACKAGES=($(sed '/^$/d; s/^[ \t]*//; s/[ \t]*$//' "$INPUT_FILE" | sort -u))

# Retrieve installed packages from system package manager
typeset -a INSTALLED_PKGS
case "$OS_ID" in
    arch|artix|endeavouros|manjaro|garuda|athenaos)
        INSTALLED_PKGS=($(pacman -Qq))
        ;;
    fedora|rhel|centos|rocky|almalinux)
        INSTALLED_PKGS=($(dnf list installed 2>/dev/null | awk 'NR>1 {print $1}' | cut -d'.' -f1))
        ;;
    ubuntu|debian|pop|mint)
        INSTALLED_PKGS=($(dpkg-query -f '${Package}\n' -W))
        ;;
    *)
        if [[ "$OS_LIKE" =~ "arch" ]]; then
            INSTALLED_PKGS=($(pacman -Qq))
        elif [[ "$OS_LIKE" =~ "fedora" ]]; then
            INSTALLED_PKGS=($(dnf list installed 2>/dev/null | awk 'NR>1 {print $1}' | cut -d'.' -f1))
        else
            INSTALLED_PKGS=($(dpkg-query -f '${Package}\n' -W))
        fi
        ;;
esac

# Build an associative lookup set for O(1) package checking
typeset -A PKG_SET
for pkg in "${INSTALLED_PKGS[@]}"; do
    PKG_SET[$pkg]=1
    # Also strip common AUR suffixes so 'zen-browser-bin' registers as 'zen-browser'
    clean_pkg="${pkg%-(bin|git|nightly|appimage)}"
    PKG_SET[$clean_pkg]=1
done

# Known binary name aliases for tools whose binary name differs from package name
typeset -A BINARY_ALIASES
BINARY_ALIASES=(
    [neovim]="nvim"
    [ripgrep]="rg"
    [fd-find]="fd"
    [batcat]="bat"
)

typeset -a MISSING_PACKAGES

# Smart verification loop
for pkg in "${INPUT_PACKAGES[@]}"; do
    # 1. Check if package name (or stripped AUR variant) is in system package manager
    if [[ -n "${PKG_SET[$pkg]}" ]]; then
        continue
    fi

    # 2. Check if the binary name (or alias) exists on $PATH (handles bob, cargo, manual binaries)
    typeset bin_name="${BINARY_ALIASES[$pkg]:-$pkg}"
    if command -v "$bin_name" &>/dev/null; then
        continue
    fi

    # 3. If neither check passed, mark as missing
    MISSING_PACKAGES+=("$pkg")
done

# Output results
{
    echo "[INFO] Detected OS: $NAME ($OS_ID)"
    echo "[INFO] Checking packages from: $INPUT_FILE"
    echo "-----------------------------------------------------"

    if (( ${#MISSING_PACKAGES} == 0 )); then
        echo "[SUCCESS] All items in '$INPUT_FILE' were found (via package manager or \$PATH)!"
    else
        echo "[RESULT] The following ${#MISSING_PACKAGES} item(s) were not found:"
        echo ""
        for pkg in "${MISSING_PACKAGES[@]}"; do
            echo "  - $pkg"
        done
        echo ""
        echo "Total missing: ${#MISSING_PACKAGES}"
    fi
} | ${=PAGER_CMD}
