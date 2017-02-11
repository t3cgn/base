class httpd {

  # firewall logic
  firewall { '100 allow http':
    chain   => 'INPUT',
    state   => ['NEW'],
    dport   => '80',
    proto   => 'tcp',
    action  => 'accept',
  }

  firewall { '100 allow https':
    chain   => 'INPUT',
    state   => ['NEW'],
    dport   => '443',
    proto   => 'tcp',
    action  => 'accept',
  }

  package { 'httpd':
    ensure  => present,
    before  => File['/etc/httpd/conf.d/vagrant.conf'],
  }

  file { '/etc/httpd/conf.d/vagrant.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => "puppet:///modules/httpd/vagrant.conf",
  }

  service { 'httpd':
    ensure     => running,
    enable     => true,
    subscribe  => File['/etc/httpd/conf.d/vagrant.conf', '/etc/php.ini'],
  }

}