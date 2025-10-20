#!/usr/bin/env nu

def main [] {
    cd ./dotfiles_manager
    go build
    mv ./dotfiles ../dotfiles
}
