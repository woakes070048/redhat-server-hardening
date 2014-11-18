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
#   [ 'syslog', 'syslog-ng' ]
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

class module (

) inherits module::params {

# list each above $variable = $module::params::variable,

# validate_absolute_path($some_path)
# validate_string($some_string)
# validate_bool($some_boolean)
# validate_re($some_regex, ['^\d+$', ''])
# validate_array($some_array)
# if $some_setting { validate_something($variable) }

  class { '::module::install': } ->
  class { '::module::config': } ~>
  class { '::module::service': } ->
  Class['::module']
}
