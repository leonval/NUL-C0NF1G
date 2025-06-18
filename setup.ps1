<#
.SYNOPSIS
    Sets up dotfiles using symbolic links for Windows.

.DESCRIPTION
    This script automates the process of creating symbolic links from a dotfiles
    repository to specified locations on a Windows system.

    It handles common dotfile directories (e.g., nvim, wezterm, kanata)
    linking them to %USERPROFILE%.
    It also includes special handling for 'powershell' dotfiles, linking them
    to %USERPROFILE%\Documents\PowerShell.

.NOTES
    - Requires Administrator privileges to create symbolic links.
    - Assumes dotfiles are organized in separate subdirectories within the
      script's parent directory (e.g., dotfiles/nvim, dotfiles/powershell).
    - Checks for existing files/directories at the target and prompts for overwrite.
#>

# --- Configuration ---
# Define the root directory of your dotfiles repository.
# This assumes the script is run from the root of your dotfiles repo, or
# you can explicitly set it: $PSScriptRoot is the directory where the script is located.
$DotfilesRepoPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# List of common dotfile directories to link directly to %USERPROFILE%
# (e.g., if 'nvim' contains '.config/nvim', it will be linked as %USERPROFILE%\.config\nvim)
$CommonDotfiles = @(
    "nvim",
    "wezterm",
    "kanata"
)

# --- Functions ---

function Test-AdminPrivileges {
    # Check if the script is running with elevated (Administrator) privileges
    $isAdministrator = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    return $isAdministrator
}

function Create-Symlink {
    param(
        [Parameter(Mandatory=$true)]
        [string]$SourcePath,

        [Parameter(Mandatory=$true)]
        [string]$TargetPath
    )

    Write-Host "  Attempting to link: '$SourcePath' -> '$TargetPath'"

    # Check if source exists
    if (-not (Test-Path -LiteralPath $SourcePath)) {
        Write-Warning "Source path '$SourcePath' does not exist. Skipping."
        return $false
    }

    # Ensure parent directory of target exists
    $targetParent = Split-Path -Path $TargetPath
    if (-not (Test-Path -LiteralPath $targetParent -PathType Container)) {
        Write-Host "  Creating target parent directory: '$targetParent'" -ForegroundColor DarkGray
        try {
            New-Item -Path $targetParent -ItemType Directory -ErrorAction Stop | Out-Null
        }
        catch {
            Write-Error "Failed to create directory '$targetParent': $_"
            return $false
        }
    }

    # Check if target already exists
    if (Test-Path -LiteralPath $TargetPath) {
        $confirm = Read-Host "  Target '$TargetPath' already exists. Overwrite? (Y/N)"
        if ($confirm -notmatch "^[yY]$") {
            Write-Host "  Skipping '$SourcePath'. Target not overwritten." -ForegroundColor Yellow
            return $false
        } else {
            Write-Host "  Removing existing target: '$TargetPath'" -ForegroundColor Yellow
            try {
                Remove-Item -LiteralPath $TargetPath -Recurse -Force -ErrorAction Stop
            }
            catch {
                Write-Error "Failed to remove existing target '$TargetPath': $_"
                return $false
            }
        }
    }

    # Create the symbolic link
    try {
        # Check if source is a directory or file for correct ItemType
        if (Test-Path -LiteralPath $SourcePath -PathType Container) {
            New-Item -ItemType SymbolicLink -Path $TargetPath -Target $SourcePath -ErrorAction Stop | Out-Null
            Write-Host "  ✅ Directory symlink created successfully." -ForegroundColor Green
        } else {
            New-Item -ItemType SymbolicLink -Path $TargetPath -Target $SourcePath -ErrorAction Stop | Out-Null
            Write-Host "  ✅ File symlink created successfully." -ForegroundColor Green
        }
        return $true
    }
    catch {
        Write-Error "Failed to create symlink from '$SourcePath' to '$TargetPath': $_"
        return $false
    }
}

# --- Main Script Logic ---

Write-Host "🚀 Welcome to your Windows Dotfiles Setup Script!"
Write-Host "This script will create symbolic links for your dotfiles."
Write-Host "Dotfiles repository assumed at: '$DotfilesRepoPath'"
Write-Host "----------------------------------------------------"

# Check for Administrator privileges
if (-not (Test-AdminPrivileges)) {
    Write-Warning "This script requires Administrator privileges to create symbolic links."
    Write-Host "Please re-run this script from an elevated PowerShell session (Run as Administrator)."
    Write-Host "Exiting."
    Exit 1
} else {
    Write-Host "✅ Running with Administrator privileges." -ForegroundColor Green
}

$overallSuccess = $true

# --- Stow Common Dotfiles to %USERPROFILE% ---
Write-Host "`n--- Linking Common Dotfiles to %USERPROFILE% ---"
foreach ($dotfileDir in $CommonDotfiles) {
    $source = Join-Path -Path $DotfilesRepoPath -ChildPath $dotfileDir
    $target = Join-Path -Path $env:USERPROFILE -ChildPath $dotfileDir # Or adjust if you want .config\$dotfileDir etc.

    # If your dotfiles packages are intended to be linked into specific subdirectories like .config
    # you would need more logic here, e.g.:
    # if ($dotfileDir -eq "nvim") { $target = Join-Path $env:USERPROFILE ".config\nvim" }

    if (-not (Create-Symlink -SourcePath $source -TargetPath $target)) {
        $overallSuccess = $false
    }
}

# --- Special Handling for PowerShell Dotfiles ---
Write-Host "`n--- Linking PowerShell Dotfiles ---"
$powershellSourcePath = Join-Path -Path $DotfilesRepoPath -ChildPath "powershell"
$powershellTargetPath = Join-Path -Path $env:USERPROFILE -ChildPath "Documents\PowerShell"

if (-not (Create-Symlink -SourcePath $powershellSourcePath -TargetPath $powershellTargetPath)) {
    $overallSuccess = $false
}


# --- Completion Message ---
Write-Host "`n----------------------------------------------------"
if ($overallSuccess) {
    Write-Host "🎉 Dotfiles setup complete! All specified links created successfully." -ForegroundColor Green
} else {
    Write-Host "⚠️ Dotfiles setup completed with some warnings or failures. Please review the output above." -ForegroundColor Yellow
}
Write-Host "You might need to restart your applications or system for some changes to take effect."
