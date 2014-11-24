# == Class: rsyslog::install
#
# See 'modules/puppet' documentation for more
# information on module parameters.
#
# == About: this module
#
# module type:
#   component
#
# conflicts with:
#   [  ]
#
# associated profiles/stacks:
#   'base::server'
#
# == About: this class
#
# description:
#   ensures rsyslog package and necessary files are present
#
class rsyslog::install {

  package { $::rsyslog::params::package_name:
    ensure => present
  }

  file { $rsyslog::params::messages_file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600'
  }

  file { $rsyslog::params::kern_file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600'
  }

  file { $rsyslog::params::daemon_file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600'
  }

  file { $rsyslog::params::syslog_file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600'
  }

  file { $rsyslog::params::unused_file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600'
  }

  file { $rsyslog::params::secure_file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600'
  }

  file { $rsyslog::params::maillog_file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600'
  }

  file { $rsyslog::params::cron_file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600'
  }
}
