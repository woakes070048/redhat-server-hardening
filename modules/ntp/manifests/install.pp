# == Class template::install
#
class ntp::install {

  package { $::ntp::package_name:
    ensure => present,
  }

  cron { 'ntpd':
    command => '/usr/sbin/ntpd -q -u ntp:ntp',
    user    => 'root',
    minute  => 15,
    require => Package[$::ntp::package_name],
  }
}
