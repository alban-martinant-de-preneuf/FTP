IFS=$'\n'

apt install sudo

for line in $(cat Shell_Userlist.csv)
do
    id=`echo $line | cut -d "," -f 1`
    firstName=`echo $line | cut -d "," -f 2`
    name=`echo $line | cut -d "," -f 3`
    pwd=`echo $line | cut -d "," -f 4`
    role=`echo $line | cut -d "," -f 5`

    userName=`echo ${firstName:0:1}$name | awk '{print tolower($0)}'`

    if let $id 2>/dev/null
    then
        #sudo userdel -r $userName
        useradd --home /ftpshare -c "$firstName $name" -u $id -s /bin/false $userName
        echo $userName:$pwd | chpasswd
        if [ $(cat /etc/group | grep ^ftpgroup: | wc -l) != 1 ]
        #Seul les membres du groupes ftpgroup ont accès au serveur FTP (voir /etc/proftpd/con.d/perso.conf)
        then
            groupadd ftpgroup
        fi
        usermod -a -G ftpgroup $userName


        if [ ${role:0:5} = "Admin" ]
        then
            #Une ligne "%sudo ALL=(ALL) ALL" est déjà présente dans /etc/sudoers
            #Je m'en sers pour donner les droits super utilisateur
            usermod -a -G sudo $userName
            usermod -d /home/$userName -s /bin/bash $userName
        fi    
    fi
done