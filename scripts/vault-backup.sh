#!/bin/bash

# === CONFIGURAZIONE ===
DATA_DIR="./data"
BACKUP_DIR="./backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/vault-backup-$DATE.tar.gz"

# === CHECK E CREAZIONE CARTELLE ===
mkdir -p "$BACKUP_DIR"

# === ESECUZIONE BACKUP ===
echo "[INFO] Backup in corso..."
tar -czf "$BACKUP_FILE" -C "$DATA_DIR" .

if [[ $? -eq 0 ]]; then
  echo "[SUCCESS] Backup completato: $BACKUP_FILE"
else
  echo "[ERROR] Backup fallito."
fi