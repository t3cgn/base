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

ssh -q -o ConnectTimeout=100 vagrant@vagrant.storage.lan exit
if [ $? -ne 0 ]
then
  # Do stuff here if example.com SSH is down
  echo 'Can not connect to vagrant.storage.lan'
  exit 1
fi

rsync -azO -gapache -oapache --chmod=g+w -e ssh vagrant@vagrant.storage.lan:/var/www/html/files/vagrant/dam-mirrors/$PROJECT/ /vagrant/

