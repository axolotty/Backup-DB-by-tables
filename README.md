# Backup-DB-by-tables
## Backup all tables in specific base
\
\
Fill all the variables in the sh file
\
\
The sh file will dump all tables in the database. It will backup in a temp folder (which is selected by $TMPFOLDER), after, a .tar.gz with all .sql will create in the destination folder (identified by $BACKUPDIR)
\
\
For the var $TMPFOLDER and $BACKUPDIR, indicate the path without the last / (e.g. TMPFOLDER=/tmp/toto)
