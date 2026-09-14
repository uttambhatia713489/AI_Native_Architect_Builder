#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# Step 1: Create Azure resources for StoreOps (Spring Boot / Java SE App Service)
# Run this once, from Azure Cloud Shell or local Azure CLI (az login first).
# ---------------------------------------------------------------------------
set -euo pipefail

# ---- Customize these ----
RESOURCE_GROUP="rg-azuser8168_mml.local-IxXPn"
LOCATION="centralindia"                 # pick a region close to Pune, e.g. centralindia / southindia
APP_SERVICE_PLAN="storeops-plan"
WEBAPP_NAME="storeops-app"              # must be globally unique; becomes storeops-app.azurewebsites.net
JAVA_RUNTIME="JAVA|21-java21"           # Java 21 (matches your Spring Boot 3.x stack); use 17-java17 if on Java 17
SKU="B1"                              # Premium v3 tier for prod; use B1 for dev/test

# 1. Resource group
az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

# 2. Linux App Service Plan
az appservice plan create \
  --name "$APP_SERVICE_PLAN" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku "$SKU" \
  --is-linux

# 3. Web App with Java SE runtime (embedded Tomcat not needed for Spring Boot's own embedded server)
az webapp create \
  --name "$WEBAPP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --plan "$APP_SERVICE_PLAN" \
  --runtime "$JAVA_RUNTIME"

# 4. Recommended app settings for Spring Boot on App Service Linux
az webapp config appsettings set \
  --name "$WEBAPP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --settings \
      WEBSITES_PORT=8080 \
      SPRING_PROFILES_ACTIVE=prod \
      JAVA_OPTS="-Xms512m -Xmx1024m"

# 5. (Optional but recommended) Create a staging deployment slot for blue-green deploys
az webapp deployment slot create \
  --name "$WEBAPP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --slot staging

echo "Done. Web App URL: https://${WEBAPP_NAME}.azurewebsites.net"
