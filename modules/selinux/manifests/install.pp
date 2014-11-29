# == Class: selinux::install
#
class selinux::install {

  package { $::selinux::params::packages:
    ensure => $::selinux::params::ensure
  }
}
