#!/bin/bash
# setup.sh - Runs ONCE when Codespace is first created

echo "🚀 Setting up Feedforward AI Course..."

# Install Claude Code globally
npm install -g @anthropic-ai/claude-code

# Save the API key to a file BEFORE remoteEnv unsets it
# This runs during postCreateCommand, before remoteEnv is applied
if [ -n "$ANTHROPIC_API_KEY" ]; then
    mkdir -p ~/.claude
    echo "$ANTHROPIC_API_KEY" > ~/.claude/.api-key-backup
    chmod 600 ~/.claude/.api-key-backup
    echo "   ✓ API key saved for later configuration"
fi

echo "✅ Setup complete!"
