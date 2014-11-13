# == Class: sudo
#
# Installs and configures sudo according to USGCB best practices
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
# == USGCB info
#
# Linux Guide:
#		2.3.1.2
# 	2.3.1.3
#
# CCERef#:
#   some CCE ref

class sudo (
  $wheel_ensure    = $::sudo::params::wheel_ensure,
  $config_file     = $::sudo::params::config_file,
  $config_template = $::sudo::params::config_template,

) inherits sudo::params {

	validate_string($wheel_ensure)
	validate_absolute_path($config_file)
	validate_string($config_template)

	class { '::sudo::install': } ->
	class { '::sudo::config': } ~>
	Class['::sudo']
}
