#!/bin/bash

#Installation du client LFTP
apt install -y lftp

#Création archive de sauvegarde
tar -czf archiveBackup.tar.gz /ftpshare/ /etc/proftpd/conf.d/ /etc/proftpd/modules.conf
mv archiveBackup.tar.gz backup_$(date +%d-%m-%Y-%H:%M).tar.gz

#Envoie de l'archive (adapter la commande de connection)
echo -e "set ssl:verify-certificate no\nput backup_$(date +%d-%m-%Y-%H:%M).tar.gz\nexit\n" | lftp Pippin:secondbreakfast@10.10.39.23
