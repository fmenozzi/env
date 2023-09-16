#!/usr/bin/env bash

set -euo pipefail

BW_CLIENTID="$(pass ava/BW_CLIENTID)"
BW_CLIENTSECRET="$(pass ava/BW_CLIENTSECRET)"
BW_PASSWORD="$(pass ava/BW_PASSWORD)"

export BW_CLIENTID BW_CLIENTSECRET BW_PASSWORD
