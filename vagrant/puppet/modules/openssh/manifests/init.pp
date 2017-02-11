class openssh {

  # firewall logic
  firewall { '100 allow openssh':
    chain   => 'INPUT',
    state   => ['NEW'],
    dport   => '22',
    proto   => 'tcp',
    action  => 'accept',
  }

  # firewall logic
  firewall { '110 allow openssh':
    chain   => 'OUTPUT',
    state   => ['NEW'],
    dport   => '22',
    proto   => 'tcp',
    action  => 'accept',
  }
#  package { 'openssh-server':
#    ensure  => present,
#    before  => File['/etc/ssh/sshd_config'],
#  }

#  file { '/etc/ssh/sshd_config':
#    ensure  => file,
#    owner   => 'root',
#    group   => 'root',
#    mode    => '0600',
#    source  => "puppet:///modules/openssh/sshd_config",
#  }

  service { 'sshd':
    ensure     => running,
    enable     => true,
#    subscribe  => File['/etc/ssh/sshd_config'],
  }

}