# Start your Box
Die Box und ein Datenbankbackup ist zu finden unter:
http://t3cgn.webicorns.com/html.tar.gz 
http://t3cgn.webicorns.com/typo3.sql

Beide Dateien werden in den Import Ordner gelegt. 

- vagrant up 
Beim hochfahren könnte es zu einem Fehler kommen <pre>The host_shell provisioner could not be found</pre>

dann bitte folgendes eingeben <pre>vagrant plugin install vagrant-host-shell</pre>

- vagrant provision 
einmal durchlaufen lassen 

- vagrant ssh 
Nach dem einloggen in den Ordner /vagrant/import als root das import.sh script durchführen.
Passwort für den root ist <pre>vagrant</pre>

- phpStorm

Port: 22086
User: vagrant 
Pw: vagrant 

Die Seite ist im Browser unter localhost:41086 zu erreichen. 

