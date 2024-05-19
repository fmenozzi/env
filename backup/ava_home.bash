#!/usr/bin/env bash

set -euo pipefail

RESTIC_PASSWORD="$(pass ava/RESTIC_PASSWORD)"

BACKUP_INCLUDE=(
    /home/fed/archive/
    /home/fed/arduino/
    /home/fed/aseprite/
    /home/fed/audio/
    /home/fed/aur/
    /home/fed/db/
    /home/fed/desktop/
    /home/fed/documents/
    /home/fed/env/
    /home/fed/freecad/
    /home/fed/images/
    /home/fed/kicad/
    /home/fed/luks/
    /home/fed/printer/
    /home/fed/projects/
    /home/fed/scratch/
    /home/fed/syncthing/
    /home/fed/videos/
    /home/fed/vault.gpgtar
    /home/fed/.bash_history
    /home/fed/.config/
    /home/fed/.gnupg/
    /home/fed/.local/
    /home/fed/.password-store/
    /home/fed/.python_history
    /home/fed/.ssh/
    /home/fed/.sqlite_history
)

BACKUP_EXCLUDE=(
    /home/fed/env/dotfiles/nvim/plugged/
    /home/fed/.local/share/Steam/
    /home/fed/.local/share/Trash
)

export RESTIC_PASSWORD BACKUP_INCLUDE BACKUP_EXCLUDE

# Clean home directory first to ensure we don't back up e.g. build artifacts.
clean /home/fed/

# Lock vault before backup.
vault lock
