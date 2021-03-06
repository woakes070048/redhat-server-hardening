# == Class: services
#
# See 'modules/puppet' documentation for more
# information on module parameters.
#
# == About: this module
#
# module type:
#   component
#
# conflicts with:
#   [  ]
#
# associated profiles/stacks:
#   'base::server'
#
class services inherits services::params {

  class { '::services::install': } ->
  class { '::services::config': } ~>
  class { '::services::service': } ->
  Class['::services']
}
