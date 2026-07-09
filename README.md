# password-manager

Password manager aziendale self-hosted, basato su [Vaultwarden](https://github.com/dani-garcia/vaultwarden), in esecuzione su una VM dedicata sulla LAN aziendale.

---

## Stack

- **Vaultwarden** (implementazione compatibile Bitwarden, Rust) come server del vault
- **Docker Compose** per l'orchestrazione del servizio
- **nginx** come reverse proxy TLS davanti a Vaultwarden
- Script di gestione dedicati: inizializzazione (`scripts/init.sh`), creazione utenti (`scripts/user-add.sh`), backup del vault (`scripts/vault-backup.sh`)
- Unit `systemd` (`systemd/vaultwarden.service`) per l'avvio come servizio di sistema

---

## Avvio

```
docker compose up -d
```

La configurazione (token amministrativo, porte, TLS) vive in `.env`, locale e non versionato — vedi `.env.example` quando disponibile.

---

## Stato

- [x] Scaffold infrastrutturale (docker-compose, nginx, script, unit systemd)
- [ ] Configurazione TLS definitiva e certificati
- [ ] Provisioning utenti aziendali
- [ ] Procedura di backup pianificata e testata
- [ ] Collegamento SSO aziendale (da valutare)

---

## Riferimenti

- [Documentazione Vaultwarden](https://github.com/dani-garcia/vaultwarden/wiki)
