# ensure that iptable-services is running befor something firewally is configured
# seems to be a CentOs specific thing, there are some hints out there, but really helpful was https://tickets.puppetlabs.com/browse/MODULES-1029?focusedCommentId=211657&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-211657
# tl;dr: don't "include firewall", but install iptables-services and uninstall firewalld before managing the firewall with "firewall"
class iptables {
    package { "firewalld":
        ensure => 'absent',
      }
	package { "iptables-services":
		ensure => installed
	}

	service { "iptables":
	    require => Package["iptables-services"],
		enable    => true,
        ensure    => running,
		hasstatus => true,
		status => "true",
		hasrestart => true,
	}

	file { "/etc/sysconfig/iptables":
		owner   => "root",
		group   => "root",
		mode    => 600,
		replace => true,
		ensure  => present,
		require => Package["iptables-services"],
		notify  => Service["iptables"],
	}
}
class { 'iptables': }

resources { "firewall":
  purge   => true
}
Firewall {
  before  => Class['fw::post'],
  require => Class['fw::pre'],
}
class { ['fw::pre', 'fw::post']: }

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

class { 'selinux':
  mode => 'permissive'
}