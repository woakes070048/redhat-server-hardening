# == Class: yum::config
#
class yum::config {

  file { '/etc/yum.repos.d':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    recurse => true,
    ignore  => '/etc/yum.repos.d';
  }

  # workaround to set different directory umask
  exec { 'yum.repos.d-mode':
    command => 'chmod 0755 /etc/yum.repos.d',
    require => File['/etc/yum.repos.d']
  }

  augeas { 'gpgcheck':
    file    => '/etc/yum.conf',
    lens    => 'yum.lns',
    changes => 'set main/gpgcheck 1'
  }

  # will be replaced with a rule to manage the yum.repos.d directory
  # and only allow configs from a pool of preconfigured templates
  exec { '/etc/yum.repos.d-gpgcheck':
    command => "sed -i 's/gpgcheck=0/gpgcheck=1/g' /etc/yum.repos.d/*",
    onlyif  => '/usr/bin/test `grep gpgcheck=0 *.repo | wc -l` -eq 0',
  }
}
