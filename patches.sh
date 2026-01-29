#!/bin/bash
# patches.sh - Remote fixes applied to all student Codespaces
#
# This script is fetched and executed by startup.sh on every Codespace start.
# Use this to push fixes to existing students without updating their repos.
#
# IMPORTANT: All patches must be idempotent (safe to run multiple times)

# =============================================================================
# PATCH 1: Ensure pip3 is installed (Debian blocks pip by default)
# =============================================================================

if ! command -v pip3 &> /dev/null; then
    echo "   Installing pip3..."
    sudo apt-get update -qq && sudo apt-get install -y -qq python3-pip
fi

# =============================================================================
# Add future patches below this line
# =============================================================================
