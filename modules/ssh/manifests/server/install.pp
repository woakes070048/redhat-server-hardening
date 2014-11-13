# == Class ssh::server::install
#
class ssh::server::install {

  package { $::ssh::params::server_package_name:
    ensure => $::ssh::params::server_ensure,
  }
}
