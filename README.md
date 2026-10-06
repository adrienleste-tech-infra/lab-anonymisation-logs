# lab-anonymisation-logs

Pseudonymisation de logs système (Linux, Windows, Zabbix) en Bash, avant analyse par une IA générative, dans le respect du RGPD et de l'AI Act.

Projet réalisé dans le cadre de la formation **TSSR** (Technicien Supérieur Systèmes et Réseaux).

## Contexte

Des techniciens collent des extraits de logs dans des assistants IA publics pour gagner du temps. Ces logs contiennent des adresses IP, des identifiants, des noms de machines, des e-mails, et parfois des mots de passe saisis par erreur. Objectif : rendre cet usage possible **sans exposer de données personnelles**.

## Ce que fait le script

`anonymise.sh` remplace chaque valeur sensible par un pseudonyme **cohérent** : la même valeur donne toujours le même code dans les trois fichiers. Le log reste lisible et exploitable pour un diagnostic.

| Donnée | Exemple de pseudonyme |
| --- | --- |
| Utilisateurs | `USER_1`, `USER_2` |
| Compte de service | `SVC_1` |
| IP internes / externes | `IP_INT_1`, `IP_EXT_1` |
| Serveurs / postes | `HOST_1`, `POSTE_1` |
| Domaine, e-mails | `DOMAINE_1`, `EMAIL_1` |
| Mot de passe saisi par erreur | `[SECRET_SUPPRIME]` |
| Empreinte de clé SSH | `SHA256:[EMPREINTE]` |

## Structure

~~~
anonymise.sh          script de pseudonymisation
correspondance.sed    règles valeur réelle -> pseudonyme (NON publié, exclu par .gitignore)
logs_bruts/           logs d'origine (NON publiés)
logs_anonymises/      logs pseudonymisés, publiables
docs/charte-ia.md     charte d'usage de l'IA pour une équipe informatique
~~~

Les règles contenant les vraies valeurs sont **séparées du code** : le script peut être publié, la table de correspondance reste en local.

## Utilisation

~~~bash
./anonymise.sh
~~~

## Vérification

Trois contrôles après chaque exécution, tous à zéro :

~~~bash
grep -ciE 'nom1|nom2|domaine' logs_anonymises/*_anon.log   # valeurs connues, sans tenir compte de la casse
grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' logs_anonymises/*_anon.log   # toute IP restante
grep -c '@' logs_anonymises/*_anon.log   # tout e-mail restant
~~~

Les deux derniers cherchent des **formes** et non des valeurs : ils détectent aussi ce que l'inventaire aurait oublié.

## Pseudonymisation, pas anonymisation

La table de correspondance permet de revenir aux valeurs réelles : il s'agit donc d'une **pseudonymisation**. Au sens du RGPD, les données restent personnelles et doivent être protégées comme telles.

## Limites connues

- Les valeurs sont listées à la main : une nouvelle IP ou un nouvel utilisateur doit être ajouté aux règles.
- `sed` est sensible à la casse : `SRV-01` et `srv-01` demandent deux règles.
- Des identifiants indirects (UID, horaires, ports) restent visibles et pourraient permettre un recoupement.

## Compétences mobilisées

Bash (variables, conditions, boucles), `sed` et expressions régulières, `grep` / `awk` / `sort` / `uniq`, Git, lecture de logs Linux / Windows / Zabbix, RGPD et AI Act.
