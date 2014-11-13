# == Class ssh::client::install
#
class ssh::client::install {

  package { $::ssh::params::client_package_name:
    ensure => $::ssh::params::client_ensure,
  }
}
