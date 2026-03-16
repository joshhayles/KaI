#!/bin/bash
# KaI — Knowledge as Infrastructure
# Run this from your project's root directory.
# Usage: curl -fsSL https://raw.githubusercontent.com/joshhayles/KaI/main/kai-init.sh | bash

set -e

echo "Setting up KaI..."

# Clone to temp directory
git clone --quiet https://github.com/joshhayles/KaI.git .kai-tmp 2>/dev/null

# Copy core files to project root
cp .kai-tmp/KAI-CONSTITUTION.md .
cp .kai-tmp/CLAUDE.md .
cp .kai-tmp/ONBOARD-ME.md .
cp .kai-tmp/CUSTOMIZE.md .

# Copy examples
mkdir -p examples
cp -r .kai-tmp/examples/* examples/ 2>/dev/null || true

# Clean up
rm -rf .kai-tmp

echo ""
echo "KaI is ready. Open Claude Code and say: \"Onboard me.\""
echo ""
