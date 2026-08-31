#!/bin/sh
set -eu
REPO_DIR="${1:-/opt/aqua-repo}"
PACK_DIR="${2:-/opt/aqua-pack}"
mkdir -p "$PACK_DIR/models"
unzip -o "$REPO_DIR/packs/aqua-11-models.zip" -d "$PACK_DIR/models"
cp "$REPO_DIR/packs/pack.json" "$PACK_DIR/pack.json"
chmod -R a+rX "$PACK_DIR"
echo "Installed Aqua pack to $PACK_DIR"
