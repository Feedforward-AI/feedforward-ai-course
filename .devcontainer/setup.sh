#!/bin/bash
# setup.sh - Runs ONCE when Codespace is first created

echo "🚀 Setting up Feedforward AI Course..."

# Install Claude Code globally
npm install -g @anthropic-ai/claude-code

# Install pip3 for Python package management
# Debian blocks pip by default, so we need to install it via apt
sudo apt-get update && sudo apt-get install -y python3-pip

echo "✅ Setup complete!"
