# iptables purge
resources { "firewall":
  purge   => true
}

Firewall {
  before  => Class['fw::post'],
  require => Class['fw::pre'],
}

include git
include dns
include openssh
include httpd
include mysql-server
include php
include rsync
include imagemagick

class { 'composer':
  user => 'root'
}

include sync-project

user { 'vagrant':
  ensure => 'present',
  groups => ['vagrant', 'apache']
}

exec { 'Fix file permissions':
  command => 'chmod -R g+w /vagrant && chown -R apache:apache /vagrant',
  path => '/usr/bin:/bin:/usr/sbin:/sbin',
}

class { ['fw::pre', 'fw::post']: }

class { 'selinux':
  mode => 'permissive'
}