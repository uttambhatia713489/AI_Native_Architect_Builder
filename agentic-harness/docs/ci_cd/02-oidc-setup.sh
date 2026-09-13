#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# Step 2: Configure OIDC federated credential so GitHub Actions can log in to
# Azure without storing any secret (client-secret-free, short-lived tokens).
# ---------------------------------------------------------------------------
set -euo pipefail

RESOURCE_GROUP="storeops-rg"
APP_DISPLAY_NAME="github-storeops-deploy"
GITHUB_ORG="uttambhatia713489"
GITHUB_REPO="agentic_harness"
GITHUB_BRANCH="main"

# 1. Create an Entra ID App Registration + Service Principal
APP_ID=$(az ad app create --display-name "$APP_DISPLAY_NAME" --query appId -o tsv)
az ad sp create --id "$APP_ID"

SUBSCRIPTION_ID=$(az account show --query id -o tsv)
TENANT_ID=$(az account show --query tenantId -o tsv)

# 2. Scope access to just the resource group (least privilege)
az role assignment create \
  --assignee "$APP_ID" \
  --role "Contributor" \
  --scope "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}"

# 3. Federated credential — trust tokens from pushes to main
az ad app federated-credential create \
  --id "$APP_ID" \
  --parameters "{
    \"name\": \"github-main-branch\",
    \"issuer\": \"https://token.actions.githubusercontent.com\",
    \"subject\": \"repo:${GITHUB_ORG}/${GITHUB_REPO}:ref:refs/heads/${GITHUB_BRANCH}\",
    \"audiences\": [\"api://AzureADTokenExchange\"]
  }"

# 4. (Optional) Federated credential for the "staging" GitHub Environment,
#    if you gate production deploys behind manual approval
az ad app federated-credential create \
  --id "$APP_ID" \
  --parameters "{
    \"name\": \"github-environment-production\",
    \"issuer\": \"https://token.actions.githubusercontent.com\",
    \"subject\": \"repo:${GITHUB_ORG}/${GITHUB_REPO}:environment:production\",
    \"audiences\": [\"api://AzureADTokenExchange\"]
  }"

echo "==================================================================="
echo "Add these as GitHub Actions REPOSITORY SECRETS (Settings > Secrets  "
echo "and variables > Actions > New repository secret):                  "
echo "  AZURE_CLIENT_ID       = ${APP_ID}"
echo "  AZURE_TENANT_ID       = ${TENANT_ID}"
echo "  AZURE_SUBSCRIPTION_ID = ${SUBSCRIPTION_ID}"
echo "==================================================================="
