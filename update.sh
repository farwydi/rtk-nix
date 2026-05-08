#!/usr/bin/env bash
set -euo pipefail

REPO="rtk-ai/rtk"
PACKAGE="package.nix"

if [ -n "${1:-}" ]; then
    VERSION="${1#v}"
else
    VERSION=$(curl -sI "https://github.com/$REPO/releases/latest" \
        | grep -i ^location: \
        | sed 's|.*/v||' \
        | tr -d '\r')
fi

echo "Updating to v$VERSION..."

URL="https://github.com/$REPO/releases/download/v${VERSION}/rtk-x86_64-unknown-linux-musl.tar.gz"
HASH=$(nix-prefetch-url "$URL" 2>/dev/null | xargs nix hash convert --hash-algo sha256 --to sri --from nix32 2>/dev/null)

echo "  version: $VERSION"
echo "  hash:    $HASH"

sed -i "s|version = \".*\"|version = \"$VERSION\"|" "$PACKAGE"
sed -i "s|hash = \".*\"|hash = \"$HASH\"|" "$PACKAGE"

echo "Done. Run 'home-manager switch' to apply."
