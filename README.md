# Start your Box
Ein Paket für Datenbank- und Filesystem-Import ist zu finden unter:

http://t3cgn.webicorns.com/export/html.tar.gz 
http://t3cgn.webicorns.com/export/typo3.sql

Im selben Verzeichnis liegt eine backup.sh, mit der man schnell und unkompliziert beide Dateien aus dem aktuellen Stand erzeugen kann.

Beide Dateien werden in den Import Ordner gelegt und über das dort vorhandene Shell-Script importiert.

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

