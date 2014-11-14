# == Class audit::install
#
class audit::install {

  package { $::audit::package_name:
    ensure => present,
  }
}
