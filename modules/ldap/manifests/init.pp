#
class ldap inherits ldap::params {

  class { '::ldap::install': } ->
  class { '::ldap::config': } ~>
  class { '::ldap::service': } ->
  Class['::ldap']
}
