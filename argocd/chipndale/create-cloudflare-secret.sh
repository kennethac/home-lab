#!/usr/bin/env bash
set -e

# Prompt for CLOUDFLARE_API_TOKEN silently if not already set in environment
if [ -z "${CLOUDFLARE_API_TOKEN}" ]; then
  read -r -s -p "Enter Cloudflare API Token: " CLOUDFLARE_API_TOKEN
  echo "" # Add newline after hidden input
  export CLOUDFLARE_API_TOKEN
fi

# Ensure the cert-manager namespace exists
kubectl create namespace cert-manager --dry-run=client -o yaml | kubectl apply -f -

# Substitute ONLY the target variable and apply to cluster
envsubst '$CLOUDFLARE_API_TOKEN' < cloudflare-secret.yaml | kubectl apply -n cert-manager -f -