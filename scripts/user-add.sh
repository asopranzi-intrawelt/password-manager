#!/bin/bash

# === CONFIGURAZIONE ===
VAULT_URL="https://passwordvault.intrawelt.local"
ADMIN_TOKEN="568255b1b242028da8bea0dda70246d7daab97aee0e0129e13f85eec8912b93f"

# === INPUT DA LINEA DI COMANDO ===
EMAIL="$1"

if [ -z "$EMAIL" ]; then
  echo "Utilizzo: $0 email@azienda.it"
  exit 1
fi

# === INVIO DELL'INVITO VIA API ===
echo "[INFO] Invio invito a $EMAIL..."

curl -k -X POST "$VAULT_URL/admin/invite" \
  -H "Authorization: $ADMIN_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"email\": \"$EMAIL\"}" \
  | jq

echo "[INFO] Fatto. Controllare email o completare la registrazione manualmente."