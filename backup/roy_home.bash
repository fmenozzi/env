#!/usr/bin/env bash

set -euo pipefail

RESTIC_PASSWORD="$(pass roy/RESTIC_PASSWORD)"

BACKUP_INCLUDE=(
    /home/fed/env/
    /home/fed/vault.gpgtar
    /home/fed/.bash_history
    /home/fed/.config/
    /home/fed/.gnupg/
    /home/fed/.password-store/
    /home/fed/.ssh
)

BACKUP_EXCLUDE=(
    /home/fed/env/dotfiles/nvim/plugged/
)

export RESTIC_PASSWORD BACKUP_INCLUDE BACKUP_EXCLUDE

# Clean home directory first to ensure we don't back up e.g. build artifacts.
clean /home/fed/

# Lock vault before backup.
vault lock
