# 💾 Backup-DB-by-tables - Sauvegarde MySQL table par table

![Bash](https://img.shields.io/badge/Bash-5%2B-informational?style=for-the-badge)
![MySQL](https://img.shields.io/badge/MySQL-MariaDB-4479A1?style=for-the-badge)
![Linux](https://img.shields.io/badge/Linux-Debian%2FUbuntu-orange?style=for-the-badge)
![Licence](https://img.shields.io/badge/Licence-MIT-green?style=for-the-badge)

Script Bash de sauvegarde d'une base de données MySQL/MariaDB **table par table**. Chaque table est exportée dans un fichier `.sql` séparé, puis l'ensemble est archivé dans un `.tar.bz2` horodaté. Les archives plus anciennes qu'un nombre de jours défini sont supprimées automatiquement.

---

## Fonctionnalités

- Export individuel de chaque table (`mysqldump --no-tablespaces`)
- Archive compressée `.tar.bz2` horodatée (`backup_wp_YYYYMMDD.tar.bz2`)
- Nettoyage automatique des archives trop anciennes (paramétrable)
- Création automatique du dossier temporaire si nécessaire

---

## Prérequis

- Bash 5+
- `mysql` et `mysqldump` installés
- Accès à la base de données MySQL/MariaDB

---

## Installation

```bash
git clone https://github.com/Axolotty/Backup-DB-by-tables.git
cd Backup-DB-by-tables
chmod +x dumpdb.sh
```

---

## Configuration

Ouvrir `dumpdb.sh` et renseigner les variables en début de fichier :

```bash
DBHOST=localhost            # Hôte MySQL
DBPASSWD=mon_mot_de_passe   # Mot de passe MySQL
DBUSER=root                 # Utilisateur MySQL
DBPORT=3306                 # Port MySQL
DBBASE=ma_base              # Base de données à sauvegarder
TEMPFOLDER=/tmp/backup_tmp  # Dossier temporaire (sans / final)
FOLDERBACKUP=/var/backup    # Dossier de destination des archives (sans / final)
TIMEDELETE=3                # Nombre de jours avant suppression automatique des archives
```

> **Note :** Indiquer les chemins **sans le `/` final**.

---

## Utilisation

### Lancement manuel

```bash
./dumpdb.sh
```

Le script :
1. Crée `$TEMPFOLDER` si inexistant
2. Liste toutes les tables de `$DBBASE`
3. Exporte chaque table dans `$TEMPFOLDER/<table>.sql`
4. Crée `$FOLDERBACKUP/backup_wp_YYYYMMDD.tar.bz2`
5. Supprime les `.sql` temporaires
6. Purge les archives de plus de `$TIMEDELETE` jours

### Automatisation via cron

Sauvegarde quotidienne à 3h du matin :

```bash
0 3 * * * /chemin/vers/dumpdb.sh >> /var/log/backup_db.log 2>&1
```

---

## Fichiers du projet

| Fichier | Description |
|---------|-------------|
| `dumpdb.sh` | Script principal de sauvegarde table par table |

---

## Licence

MIT © Axolotty
