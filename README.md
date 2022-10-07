Création d'utilisateurs :
Le script de création des utilisateurs à partir du CSV est "usersCSVcreate.sh", il doit être dans le même dossier que "Shell_Userlist.csv". Étant donné que les UIDs sont imposés, il faudra le lancer AVANT l'installation de proFTPd (ou supprimer "-u $id à la ligne 20") pour ne pas avoir de problème avec les utilisateurs Merry et Pippin créés dans "FTPautoInstall.sh".

Installation :
Le script d'installation de proFTPd est "FTPautoInstall.sh", il a besoin que les fichiers de configuration "perso.conf", "tls.conf" et "modules.conf" soient dans le même dossier.

Sauvegarde automatique :
Pour la sauvegarde automatique il faut configurer cron (de root)pour qu'il lance périodiquement "backup.sh". Par example pour une sauvegarde mensuelle :
crontab -e
puis :
0 0 1 * * /chemin/vers/backupFTP.sh

Désinstallation :
Pour faire le travail inverse de "FTPautoInstall.sh" il faut lancer "FTPremove.sh".
Pour supprimer les utilisateurs du CSV, il faut lancer "usersCSVdelete.sh".
