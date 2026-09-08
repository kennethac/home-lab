#!/usr/bin/env bash
set -e

# Prompt for CLIENT_ID if not already set in the environment
if [ -z "${CLIENT_ID}" ]; then
  read -r -p "Enter Tailscale Client ID: " CLIENT_ID
  export CLIENT_ID
fi

# Prompt for CLIENT_SECRET silently if not already set
if [ -z "${CLIENT_SECRET}" ]; then
  read -r -s -p "Enter Tailscale Client Secret: " CLIENT_SECRET
  echo "" # Add newline after hidden input
  export CLIENT_SECRET
fi

# Substitute ONLY the target variables and apply to cluster
envsubst '$CLIENT_ID,$CLIENT_SECRET' < tailscale-secret.yaml | kubectl apply -n tailscale -f -