#!/bin/bash

#Suppression de proftpd config incluse
apt purge -y proftpd-*

#Suppression des utilisateurs (leur home /ftpshare est supprimé aussi)
userdel -r Merry
userdel -r Pippin

#Suppression du groupe ftpgroupe
groupdel ftpgroup
