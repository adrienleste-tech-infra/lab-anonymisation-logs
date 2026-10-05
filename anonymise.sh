#!/bin/bash
# anonymise.sh : pseudonymise les logs avant envoi a une IA
# Les valeurs reelles sont dans correspondance.sed (jamais publie).

REGLES="correspondance.sed"

if [ ! -f "$REGLES" ]; then
  echo "Erreur : $REGLES introuvable"
  exit 1
fi

for NOM in auth zabbix windows; do
  sed -E -f "$REGLES" "logs_bruts/$NOM.log" > "logs_anonymises/${NOM}_anon.log"
  echo "Termine : logs_anonymises/${NOM}_anon.log"
done
