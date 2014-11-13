# == Class module::install
#
class module::install {

  package { 'pam':
    name   => $::pam::params::package_name,
    ensure => present,
  }

  package { 'pam-ccreds':
    ensure => absent,
  }
}
