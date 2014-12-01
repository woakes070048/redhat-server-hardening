#
class ldap::install {

  package { $::ldap::params::packages:
    ensure => $::ldap::params::ensure
  }
}
