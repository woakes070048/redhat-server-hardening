# == Class: module
#
# Installs and configures module according to USGCB best practices
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
# == USGCB info
#
# LinuxGuide:
#   section x
#		section y
#
# CCERef#:
#   some CCE ref

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
