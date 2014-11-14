# == Class iptables::install
#
class iptables::install {

  service { "firewalld":
    ensure => stopped,
    enable => false,
  }

  package { $::iptables::package_name:
    ensure => present,
    require => Service['firewalld'],
  }
}
