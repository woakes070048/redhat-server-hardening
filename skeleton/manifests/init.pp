# == Class: $module_name
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
class $module_name inherits $module_name::params {

  class { '::$module_name::install': } ->
  class { '::$module_name::config': } ~>
  class { '::$module_name::service': } ->
  Class['::$module_name']
}
