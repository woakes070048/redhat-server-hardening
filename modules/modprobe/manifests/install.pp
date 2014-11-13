# == Class modprobe::install
#
class modprobe::install {

  package { $::modprobe::package_name:
    ensure => present,
  }
}
