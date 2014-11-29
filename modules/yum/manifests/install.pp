# == Class: $module_name::install
#
class $module_name::install {

  package { $::$module_name::params::packages:
    ensure => $::$module_name::params::ensure
  }
}
