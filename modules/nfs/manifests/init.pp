# == Class: nfs
#
# Installs and configures nfs according to USGCB best practices
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
# == USGCB info
#
# LinuxGuide:
# 2.3.4.2
#
# CCERef#:
# CCE-4090-7
#
class nfs (

) inherits nfs::params {

# list each above $variable = $nfs::params::variable,

# validate_absolute_path($some_path)
# validate_string($some_string)
# validate_bool($some_boolean)
# validate_re($some_regex, ['^\d+$', ''])
# validate_array($some_array)
# if $some_setting { validate_something($variable) }

  class { '::nfs::install': } ->
  class { '::nfs::config': } ~>
  class { '::nfs::service': } ->
  Class['::nfs']
}
