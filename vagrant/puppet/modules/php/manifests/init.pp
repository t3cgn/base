class php {
  package { [
    'php70w-cli',
    'php70w',
    'php70w-opcache',
    'php70w-pdo',
    'php70w-xml',
    'php70w-mbstring',
    'php70w-gd',
    'php70w-mysqlnd',
    'php70w-soap',
  ]:
    ensure => present,
    before  => File['/etc/php.ini'],
  }

  file { '/etc/php.ini':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => "puppet:///modules/php/php.ini",
  }
   file { '/var/www/temp':
        owner   => 'vagrant',
        group   => 'apache',
        mode    => '0775',
        ensure => 'directory',
      }
}