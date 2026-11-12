#!/usr/bin/env bash

# Usage:
# ./install.sh VERSION
#
# Example:
# ./install.sh 1.0.0


VERSION="${1:-}"
REPO_URL="https://github.com/Chris022/math-templates.git"

if [[ -z "$VERSION" || -z "$REPO_URL" ]]; then
    echo "Usage: $0 VERSION REPOSITORY_URL [PACKAGE_NAME]"
    exit 1
fi

# Infer package name from repository URL
REPO_NAME="${REPO_URL##*/}"
REPO_NAME="${REPO_NAME%.git}"
PACKAGE_NAME="${3:-$REPO_NAME}"

TAG="v${VERSION}"

# Typst local package directory (supports custom XDG_DATA_HOME)
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"
PACKAGE_DIR="$DATA_DIR/typst/packages/local/$PACKAGE_NAME"
TARGET_DIR="$PACKAGE_DIR/$VERSION"

# Check dependencies
for cmd in git mktemp; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: $cmd is required."
        exit 1
    fi
done

# Prevent accidental overwrites
if [[ -e "$TARGET_DIR" ]]; then
    echo "Error: Version $VERSION is already installed."
    echo "Location: $TARGET_DIR"
    exit 1
fi

echo "Installing $PACKAGE_NAME version $VERSION..."

# Create temporary directory
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

# Clone the requested release tag
git clone \
    --depth 1 \
    --branch "$TAG" \
    "$REPO_URL" \
    "$TMP_DIR/package"

# Create destination and install
mkdir -p "$PACKAGE_DIR"
mv "$TMP_DIR/package" "$TARGET_DIR"

echo ""
echo "Successfully installed!"
echo "Package: $PACKAGE_NAME"
echo "Version: $VERSION"
echo "Location: $TARGET_DIR"
echo ""
echo "Import it in Typst using:"
echo "#import \"@local/$PACKAGE_NAME:$VERSION\": *"
