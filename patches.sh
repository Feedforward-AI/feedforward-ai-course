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
# PATCH 2: Fix Claude Code auth conflict (removes apiKeyHelper approach)
# =============================================================================
# The old approach used both apiKeyHelper AND ANTHROPIC_API_KEY, causing conflict.
# New approach: Save key to file, use remoteEnv to hide env var from Claude.
# Note: For existing Codespaces, user may need to rebuild for full fix.

# Run if old api-key-helper.sh exists OR if backup file doesn't exist yet
if [ -f ~/.claude/api-key-helper.sh ] || [ ! -f ~/.claude/.api-key-backup ]; then
    echo "   Updating Claude Code auth configuration..."

    # Remove old helper scripts
    rm -f ~/.claude/api-key-helper.sh
    rm -f ~/.claude/.api-key

    # Save API key to backup file (for use after remoteEnv hides the env var)
    if [ -n "$ANTHROPIC_API_KEY" ]; then
        mkdir -p ~/.claude
        echo "$ANTHROPIC_API_KEY" > ~/.claude/.api-key-backup
        chmod 600 ~/.claude/.api-key-backup
    fi

    # Read key from backup (or env var as fallback)
    API_KEY=""
    if [ -f ~/.claude/.api-key-backup ]; then
        API_KEY=$(cat ~/.claude/.api-key-backup)
    elif [ -n "$ANTHROPIC_API_KEY" ]; then
        API_KEY="$ANTHROPIC_API_KEY"
    fi

    # Configure Claude with the key
    if [ -n "$API_KEY" ]; then
        cat > ~/.claude.json << CLAUDE_JSON
{
  "hasCompletedOnboarding": true,
  "primaryApiKey": "${API_KEY}"
}
CLAUDE_JSON
        chmod 600 ~/.claude.json
    fi

    # Rewrite settings.json without apiKeyHelper
    cat > ~/.claude/settings.json << 'SETTINGS_EOF'
{
  "apiProvider": "anthropic"
}
SETTINGS_EOF

    # Remove the old bash alias if present
    sed -i '/alias claude=/d' ~/.bashrc 2>/dev/null || true

    echo "   ✓ Auth configuration updated"
fi

# =============================================================================
# Add future patches below this line
# =============================================================================
