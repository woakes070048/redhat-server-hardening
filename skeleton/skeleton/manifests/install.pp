# == Class template::install
#
class template::install {

  package { $::template::package_name:
    ensure => present,
  }
}
