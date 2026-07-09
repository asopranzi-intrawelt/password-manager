#!/bin/bash

set -e

# Parametri
DOMAIN="passwordvault.intrawelt.local"
CERT_DIR="./certs"
NGINX_CONF="./nginx/nginx.conf"

echo "[INFO] Creazione directory se non esistono..."
mkdir -p certs nginx data

# Generazione certificato self-signed se non già presente
if [[ ! -f "$CERT_DIR/cert.pem" || ! -f "$CERT_DIR/key.pem" ]]; then
  echo "[INFO] Generazione certificato self-signed per $DOMAIN..."
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$CERT_DIR/key.pem" \
    -out "$CERT_DIR/cert.pem" \
    -subj "/C=IT/ST=LAN/L=Company/O=IT/CN=$DOMAIN"
else
  echo "[INFO] Certificati già presenti. Skipping."
fi

# Avvio dei container
echo "[INFO] Avvio dei container Docker..."
docker compose up -d

echo "[SUCCESS] Vaultwarden è stato avviato. Accedi da https://$DOMAIN"