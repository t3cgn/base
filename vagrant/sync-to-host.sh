#!/bin/bash

SSHKEY=$(vagrant ssh-config | grep "IdentityFile" | awk  '{split($0,array,".vagrant")} END{print array[2]}')
PORT=$(vagrant ssh-config | grep "Port" | awk  '{print $2}')

rsync -az -e "ssh -p${PORT} -i${PWD}/.vagrant${SSHKEY}" vagrant@localhost:/vagrant/ ./