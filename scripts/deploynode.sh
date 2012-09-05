#!/bin/bash
DATE=`date +%Y%m%d%H%M`
echo $DATE
cp -R /home/user01/github/AdNode /home/user01/github/AdNode$DATE
cd /home/user01/github/AdNode
git pull
rm /usr/src/Ad
ln -s /home/user01/github/AdNode /usr/src/Ad
cp /usr/src/Ad/nginx/default /etc/nginx/sites-available/default
cp /usr/src/Ad/scripts/*.sh /usr/bin/
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
