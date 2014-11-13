# == Class puppet::service
#
# This class is meant to be called from puppet
# It ensure the service is running
#
class puppet::service {

  service { $::puppet::service_name:
    ensure     => running,
    enable     => true,
  }

  cron { 'puppet-agent':
    ensure => present,
    user => root,
    minute => 30,
    command => '/usr/bin/puppet agent --onetime --no-daemonize --splay'
  }
}
