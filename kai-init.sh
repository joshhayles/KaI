#!/bin/bash
# KaI — Knowledge as Infrastructure
# Run this from your project's root directory.
# Usage: curl -fsSL https://raw.githubusercontent.com/joshhayles/KaI/main/kai-init.sh | bash

set -e

# Clean up temp directory on exit (including interrupts)
trap 'rm -rf .kai-tmp' EXIT

echo "Setting up KaI..."

# Clone repo — show errors if network fails
if ! git clone --quiet https://github.com/joshhayles/KaI.git .kai-tmp; then
  echo ""
  echo "  Error: Could not download KaI. Check your network connection and try again."
  exit 1
fi

# Prevent double-install conflicts
if [ -d "kai" ]; then
  echo ""
  echo "  Found existing kai/ directory. KaI may already be installed."
  echo "  To reinstall, remove the kai/ folder first: rm -rf kai"
  exit 1
fi

# Create kai/ directory structure
mkdir -p kai/docs/templates kai/docs/examples kai/projects/active kai/projects/completed kai/projects/ideas kai/projects/archive

# Copy KaI files into kai/
cp .kai-tmp/kai/KAI-CONSTITUTION.md kai/
cp .kai-tmp/kai/ONBOARD-ME.md kai/
cp .kai-tmp/kai/docs/README.md kai/docs/
cp .kai-tmp/kai/docs/projects.md kai/docs/
cp .kai-tmp/kai/docs/customizing.md kai/docs/
cp -r .kai-tmp/kai/docs/templates/* kai/docs/templates/ 2>/dev/null || true
cp -r .kai-tmp/kai/docs/examples/* kai/docs/examples/ 2>/dev/null || true

# Create stub profile (populated during onboarding)
cat > kai/profile.md << 'PROFILE'
# Developer Profile

> This file is populated during onboarding. Say "Onboard me" to get started,
> or fill this in manually. Your Claude reads this every session.

## Role
{Your role and experience level}

## Current Focus
{What you're building}

## How I Learn
{Your preferences — how you like to work with AI}

## Goals
{What you're working toward}
PROFILE

# Handle CLAUDE.md — check if user already has one
if [ -f "CLAUDE.md" ]; then
  cp .kai-tmp/CLAUDE.md kai-CLAUDE.md
  echo ""
  echo "  Found existing CLAUDE.md."
  echo "  Created kai-CLAUDE.md alongside it."
  echo "  During onboarding, your Claude will help you connect them."
  echo ""
  echo "  Quick option: add this line to your CLAUDE.md:"
  echo "    Read kai-CLAUDE.md for context routing and project management."
else
  cp .kai-tmp/CLAUDE.md .
fi

echo ""
echo "KaI is ready. Open Claude Code and say: \"Onboard me.\""
echo ""
