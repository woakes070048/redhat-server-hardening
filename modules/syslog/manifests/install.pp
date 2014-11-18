# == Class: syslog::service
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
#   [ 'rsyslog', 'syslog-ng' ]
#
# associated profiles/stacks:
#   'base::server::log'
#
# == About: this class
#
# description:
#   ensures syslog package and necessary files are present
#
class syslog::install {

  package { $::syslog::package_name:
    ensure => present,
  }

  file { $syslog::params::messages_file:
    ensure => present;
    owner  => 'root',
    group  => 'root',
    mode   => '0600'

  file { $syslog::params::kern_file:
    ensure => present;
    owner  => 'root',
    group  => 'root',
    mode   => '0600'

  file { $syslog::params::daemon_file:
    ensure => present;
    owner  => 'root',
    group  => 'root',
    mode   => '0600'

  file { $syslog::params::syslog_file:
    ensure => present;
    owner  => 'root',
    group  => 'root',
    mode   => '0600'

  file { $syslog::params::unused_file:
    ensure => present;
    owner  => 'root',
    group  => 'root',
    mode   => '0600'

  file { $syslog::params::secure_file:
    ensure => present;
    owner  => 'root',
    group  => 'root',
    mode   => '0600'

  file { $syslog::params::maillog_file:
    ensure => present;
    owner  => 'root',
    group  => 'root',
    mode   => '0600'

  file { $syslog::params::cron_file:
    ensure => present;
    owner  => 'root',
    group  => 'root',
    mode   => '0600'
  }
}
