#!/bin/sh
set -eu
REPO_DIR="${1:-/opt/aqua-repo}"
PACK_DIR="${2:-/opt/aqua-pack}"
rm -rf "$PACK_DIR/models"
mkdir -p "$PACK_DIR/models"
unzip -o "$REPO_DIR/packs/aqua-11-models.zip" -d "$PACK_DIR/models"
cat "$REPO_DIR"/packs/frenchangelfish.glb.xz.b64.* | base64 -d | xz -d > "$PACK_DIR/models/frenchangelfish.glb"
cp "$REPO_DIR/packs/pack.json" "$PACK_DIR/pack.json"
chmod -R a+rX "$PACK_DIR"
echo "Installed Aqua pack (12 models) to $PACK_DIR"
