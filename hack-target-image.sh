#!/bin/bash

set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")" || exit 1

CURRENT_DIR=$(pwd)

STAGENAME="45-libunibreak"
source "$CURRENT_DIR/scripts.d/$STAGENAME.sh"
git-mini-clone "$SCRIPT_REPO" "$SCRIPT_COMMIT" "/$STAGENAME"
cd "/$STAGENAME"
ffbuild_dockerbuild
cp -af "$FFBUILD_DESTDIR"/. /
rm -rf "$FFBUILD_DESTPREFIX"/bin
rm -rf "/$STAGENAME"
cd "$CURRENT_DIR"

STAGENAME="50-libass"
source "$CURRENT_DIR/scripts.d/$STAGENAME.sh"
git-mini-clone "$SCRIPT_REPO" "$SCRIPT_COMMIT" "/$STAGENAME"
cd "/$STAGENAME"
ffbuild_dockerbuild
cp -af "$FFBUILD_DESTDIR"/. /
rm -rf "$FFBUILD_DESTPREFIX"/bin
rm -rf "/$STAGENAME"
cd "$CURRENT_DIR"
