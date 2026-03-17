#!/bin/bash
# KaI — Knowledge as Infrastructure
# Run this from your project's root directory.
# Usage: curl -fsSL https://raw.githubusercontent.com/joshhayles/KaI/main/kai-init.sh | bash

set -e

echo "Setting up KaI..."

# Clone to temp directory
git clone --quiet https://github.com/joshhayles/KaI.git .kai-tmp 2>/dev/null

# Create kai/ directory structure
mkdir -p kai/docs/templates kai/docs/examples kai/projects/active

# Copy KaI files into kai/
cp .kai-tmp/kai/KAI-CONSTITUTION.md kai/
cp .kai-tmp/kai/ONBOARD-ME.md kai/
cp .kai-tmp/kai/docs/projects.md kai/docs/
cp .kai-tmp/kai/docs/customizing.md kai/docs/
cp -r .kai-tmp/kai/docs/templates/* kai/docs/templates/ 2>/dev/null || true
cp -r .kai-tmp/kai/docs/examples/* kai/docs/examples/ 2>/dev/null || true

# Handle CLAUDE.md — check if user already has one
if [ -f "CLAUDE.md" ]; then
  cp .kai-tmp/CLAUDE.md kai-CLAUDE.md
  echo ""
  echo "  Found existing CLAUDE.md."
  echo "  Created kai-CLAUDE.md alongside it."
  echo "  During onboarding, your Claude will help you connect them."
else
  cp .kai-tmp/CLAUDE.md .
fi

# Clean up
rm -rf .kai-tmp

echo ""
echo "KaI is ready. Open Claude Code and say: \"Onboard me.\""
echo ""
