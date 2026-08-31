#!/bin/sh
set -eu
REPO_DIR="${1:-/opt/aqua-repo}"
PACK_DIR="${2:-/opt/aqua-pack}"
ARCHIVE="$REPO_DIR/packs/aqua-12-models-complete.zip"
[ -f "$ARCHIVE" ] || { echo "Missing $ARCHIVE" >&2; exit 1; }
rm -rf "$PACK_DIR/models"
mkdir -p "$PACK_DIR/models"
unzip -o "$ARCHIVE" -d "$PACK_DIR/models"
COUNT=$(find "$PACK_DIR/models" -maxdepth 1 -type f -name '*.glb' | wc -l)
[ "$COUNT" -eq 12 ] || { echo "Expected 12 GLB models, found $COUNT" >&2; exit 1; }
cp "$REPO_DIR/packs/pack.json" "$PACK_DIR/pack.json"
chmod -R a+rX "$PACK_DIR"
echo "Installed Aqua pack: 12 models to $PACK_DIR"
