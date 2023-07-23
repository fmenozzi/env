#!/usr/bin/env bash

set -euo pipefail

RESTIC_PASSWORD="$(pass ava/RESTIC_PASSWORD)"
RCLONE_CONFIG_PASS="$(pass ava/RCLONE_CONFIG_PASS)"
DISK_PASSWORD="$(pass ava/DISK_PASSWORD)"
AWS_ACCESS_KEY_ID="$(pass ava/AWS_ACCESS_KEY_ID)"
AWS_SECRET_ACCESS_KEY="$(pass ava/AWS_SECRET_ACCESS_KEY)"
AWS_DEFAULT_REGION="$(pass ava/AWS_DEFAULT_REGION)"

export RESTIC_PASSWORD RCLONE_CONFIG_PASS DISK_PASSWORD AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION