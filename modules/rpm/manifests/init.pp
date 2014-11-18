# == Class: rpm
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
#   'base'
#
class rpm inherits rpm::params {

  class { '::rpm::install': } ->
  class { '::rpm::config': } ~>
  class { '::rpm::service': } ->
  Class['::rpm']
}
