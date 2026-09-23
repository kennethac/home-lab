#!/usr/bin/env bash
set -e

# Prompt for TSIG_SECRET silently if not already set in the environment
if [ -z "${TSIG_SECRET}" ]; then
  read -r -s -p "Enter Technitium TSIG Secret: " TSIG_SECRET
  echo "" # Add newline after hidden input
  export TSIG_SECRET
fi

# Substitute ONLY the target variable and apply to cluster
envsubst '$TSIG_SECRET' < technitium-secret.yaml | kubectl apply -n kube-system -f -