# == Class: login
#
# Installs and configures login according to USGCB best practices
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
#   CCE-14063-2

class login (

  $config_file = $::login::params::config_file

) inherits login::params {

validate_absolute_path($config_file)

  class { '::login::config': } ->
  Class['::login']
}
