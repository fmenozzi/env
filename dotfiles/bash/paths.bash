#!/usr/bin/env bash

export GOPATH=~/.go
export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/

paths=(
  $HOME/.bin
  $DOTFILES_PATH/git/custom-commands
  $ENV_PATH/scripts
  $HOME/.cargo/bin
  $GOPATH/bin
)

export PATH=$PATH:$(IFS=':'; printf '%s' "${paths[*]}")
