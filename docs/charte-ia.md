# Charte d'usage de l'IA pour l'équipe informatique

**L'IA peut nous aider à lire des logs, à condition de ne jamais lui confier une donnée personnelle ou un secret.**

## Permis
- Utiliser l'outil IA validé par l'entreprise, avec le compte professionnel fourni.
- Lui faire expliquer une commande, un code d'événement, un message d'erreur.
- Lui soumettre des extraits de logs pseudonymisés et filtrés.

## Interdit
- Coller un log brut (IP, noms, e-mails, machines, domaine).
- Envoyer un mot de passe, une clé, un jeton, même tapé par erreur.
- Utiliser un compte personnel pour des données de l'entreprise ou d'un client.
- Laisser l'IA décider seule d'une action, ou s'en servir pour surveiller un salarié.

## Avant d'envoyer des logs : 5 étapes
1. **Filtrer** : garder seulement les lignes utiles.
2. **Pseudonymiser** avec le script de l'équipe.
3. **Supprimer** tout secret.
4. **Vérifier** : aucune IP, aucun `@`, aucun nom réel.
5. **Relire** avant d'envoyer.

## Tracer
Noter dans le ticket : outil, date, prompt pseudonymisé, résumé de la réponse, ce qui a été vérifié.

## Vérifier
L'IA peut se tromper avec assurance : chaque conclusion doit être confirmée par une ligne de log.

## En cas de doute
| Situation | Contact |
| --- | --- |
| Doute sur une donnée personnelle | DPO |
| Secret envoyé par erreur | RSSI, immédiatement (le secret doit être changé) |
| Outil autorisé ? | Responsable informatique |
