class mysql-server {

  # firewall logic
  firewall { '100 allow mysql':
    chain   => 'INPUT',
    state   => ['NEW'],
    dport   => '3306',
    proto   => 'tcp',
    action  => 'accept',
  }

  # firewall logic
  firewall { '110 allow mysql':
    chain   => 'OUTPUT',
    state   => ['NEW'],
    dport   => '3306',
    proto   => 'tcp',
    action  => 'accept',
  }

  class { '::mysql::server':
    root_password           => 'vagrant',
    remove_default_accounts => true,
    #  override_options        => $override_options
  }

  mysql::db { 'vagrant':
    user     => 'vagrant',
    password => 'vagrant',
    host     => 'localhost',
    grant    => ['ALL'],
  }
}