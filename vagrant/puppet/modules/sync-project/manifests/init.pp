class sync-project {
  file { '/home/vagrant/.ssh/id_rsa':
    ensure  => file,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0600',
    source  => "puppet:///modules/sync-project/vagrant-internal",
  }

  file { '/home/vagrant/.ssh/known_hosts':
    ensure  => file,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0644',
    source  => "puppet:///modules/sync-project/known_hosts",
  }

  file { '/home/vagrant/sync-dam.sh':
    ensure  => file,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0755',
    source  => "puppet:///modules/sync-project/sync-dam.sh",
  }

  file { '/home/vagrant/sync-db.sh':
    ensure  => file,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0755',
    source  => "puppet:///modules/sync-project/sync-db.sh",
  }
}

