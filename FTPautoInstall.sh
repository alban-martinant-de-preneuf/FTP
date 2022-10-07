#!/bin/bash

#Mise à jour et installation des programmes
apt -y update && apt -y upgrade
apt install -y proftpd-*

#Ajout des utilisateurs et groupe
addgroup ftpgroup
echo -e "kalimac\nkalimac\nMerry\n\n\n\n\no\n" | adduser Merry --force-badname --shell /bin/false --home /ftpshare
echo -e "secondbreakfast\nsecondbreakfast\nPippin\n\n\n\n\no\n" | adduser Pippin --force-badname --shell /bin/false --home /ftpshare
chmod -R 1777 /ftpshare/
adduser Merry ftpgroup
adduser Pippin ftpgroup

#config generale
cp proftpd.conf /etc/proftpd/proftpd.conf
cp perso.conf /etc/proftpd/conf.d/perso.conf

#confif TLS
mkdir /etc/proftpd/ssl
echo -e "FR\nFRANCE\nMarseille\n\n\n\nalban.martinant-de-preneuf@laplateforme.io\n" | openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert
chmod 600 /etc/proftpd/ssl/proftpd.*
cp tls.conf /etc/proftpd/conf.d/tls.conf
cp modules.conf /etc/proftpd/modules.conf

#Relancer le service ProFTP
service proftpd restart
