#!/bin/bash
DATE=$1
echo $DATE
rm /usr/src/Ad
ln -s /home/user01/github/AdNode$DATE /usr/src/Ad
cp /usr/src/Ad/scripts/*.sh /usr/bin/
cp /usr/src/Ad/nginx/default /etc/nginx/sites-available/default
chmod 755 /usr/bin/deploynode.sh
chmod 755 /usr/bin/rollback.sh
chmod 755 /usr/bin/rollbacknode.sh
chmod 755 /usr/bin/deploy.sh
stop adnode01
stop adnode02
stop adnode03
stop adnode04
stop adnode05
/etc/init.d/nginx restart
