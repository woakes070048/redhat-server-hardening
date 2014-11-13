# == Class module::install
#
class module::install {

  package { $::module::package_name:
    ensure => present,
  }
}
