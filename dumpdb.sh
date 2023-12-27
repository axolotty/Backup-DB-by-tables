#!/bin/bash

DBHOST=
DBPASSWD=
DBUSER=
DBPORT=
DBBASE=
TEMPFOLDER=
FOLDERBACKUP=
#For the var TIMEDELETE, only numbers.
#It's defines the maximum time (in days) to keep backup files before automatic delete
TIMEDELETE=3

if [ -d "$TEMPFOLDER ] ; then
    echo "The temporary folder $TEMPFOLDER exist!"
else 
    echo "The temporary folder $TEMPFOLDER not exist! Creating this..."
    mkdir -p $TEMPFOLDER

fi
    
for i in $(mysql -u $DBUSER -h $DBHOST -p$DBPASSWD -P $DBPORT -D $DBBASE -e "show tables;")
    do mysqldump --no-tablespaces -h $DBHOST -u $DBUSER -p$DBPASSWD -P $DBPORT $DBBASE $i > $TEMPFOLDER/$i".sql"
done

cd $FOLDERBACKUP
tar -cjf "backup_wp_"$(date +'%Y%m%d')".tar.bz2" $TEMPFOLDER/*.sql
rm -rf $TMPFOLDER/*.sql

find $FOLDERBACKUP/ -name '*.tar.bz2' -mtime +$TIMEDELETE -exec rm {} \; 
