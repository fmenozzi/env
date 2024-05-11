#!/usr/bin/env bash

set -euo pipefail

RESTIC_PASSWORD="$(pass hal/RESTIC_PASSWORD)"

BACKUP_INCLUDE=(
    /home/fed/.bash_history
    /home/fed/.config/
    /home/fed/.gnupg/
    /home/fed/.password-store/
    /home/fed/.ssh
)

BACKUP_EXCLUDE=()

export RESTIC_PASSWORD BACKUP_INCLUDE BACKUP_EXCLUDE
