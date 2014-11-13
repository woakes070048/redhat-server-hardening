# == Class: modprobe
#
# Installs and configures modprobe according to USGCB best practices
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

class modprobe (

) inherits modprobe::params {

# list each above $variable = $modprobe::params::variable,

# validate_absolute_path($some_path)
# validate_string($some_string)
# validate_bool($some_boolean)
# validate_re($some_regex, ['^\d+$', ''])
# validate_array($some_array)
# if $some_setting { validate_something($variable) }

  class { '::modprobe::install': } ->
  class { '::modprobe::config': } ~>
  class { '::modprobe::service': } ->
  Class['::modprobe']
}
