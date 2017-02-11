#!/bin/bash

PROJECT=vagrant

while getopts ":p:" opt; do
  case $opt in
    p)
      PROJECT="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

ssh -q -o BatchMode=yes -o ConnectTimeout=10 vagrant@vagrant.storage.lan exit
if [ $? -ne 0 ]
then
  # Do stuff here if example.com SSH is down
  echo 'Can not connect to vagrant.storage.lan'
  exit 1
fi

rsync -azO -e ssh vagrant@vagrant.storage.lan:/var/www/html/files/vagrant/database-dumps/$PROJECT/dump.sql.gz ~/dump.sql.gz

gunzip ~/dump.sql.gz

mysql -uvagrant -pvagrant vagrant < dump.sql

rm -f dump.sql.gz dump.sql
