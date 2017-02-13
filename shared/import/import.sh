#!/bin/sh

DbServ='localhost'
Dabase='vagrant'
DbUser='vagrant'
DbPass='vagrant'

BckDir="VM_$Date"
BckSrc="/var/www"
BckSub="html"
WebGrp="apache"
WebUsr="vagrant"

echo ""
echo "Start this script as root!"
echo ""
echo "Sure to restore website?"
read

echo "cleanup database"
mysqladmin  --host=localhost --user=vagrant --password=vagrant -f drop vagrant
mysqladmin  --host=localhost --user=vagrant --password=vagrant -f create vagrant
echo "delete old docroot"
rm -R -f /var/www/html/*
echo "import database"
/usr/bin/./mysql --host=localhost --user=vagrant --password=vagrant vagrant < typo3.sql
echo "extract new docroot"
tar xzf html.tar.gz -C /var/www/html/
echo "cleanup typo3 dir"
cd /var/www/html/
find typo3temp -type f -exec rm -f {} \;
echo "setup rights"
chmod -R 775 /var/www/html/
chown -R vagrant:apache /var/www/html/