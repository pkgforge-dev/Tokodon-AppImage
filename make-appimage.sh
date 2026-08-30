#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q tokodon | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/org.kde.tokodon.svg
export DESKTOP=/usr/share/applications/org.kde.tokodon.desktop
export STARTUPWMCLASS=org.kde.tokodon
export DEPLOY_PIPEWIRE=1

# Deploy dependencies
quick-sharun /usr/bin/tokodon

# Turn AppDir into AppImage
quick-sharun --make-appimage
